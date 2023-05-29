import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.rmi.RemoteException;
import java.util.Map;
import java.util.Optional;


public class Irc extends Frame {
    public TextArea text;
    public TextField data;
    public static Client client;
    SharedObject_itf sentence;
    static String myName = "tester";

    public static void main(String argv[]) throws RemoteException {

//        Server.init();

//        if (argv.length != 1) {
//            System.out.println("java Irc <name>");
//            return;
//        }
//
//        myName = argv[0];

        // initialize the system

        Client initializedClient = new Client();
        initializedClient.init();

        client = initializedClient;

        // look up the IRC object in the name server
        // if not found, create it, and register it in the name server
        SharedObject_itf s = initializedClient.lookup("IRC");

        if (s == null) {
            s = client.create(new Sentence());
            client.register("IRC", s);
        }

        // create the graphical part
        new Irc(s);
    }

    public Client getClient() {
        return client;
    }

    public Irc(SharedObject_itf s) {

        setLayout(new FlowLayout());

        text = new TextArea(10, 60);
        text.setEditable(false);
        text.setForeground(Color.red);
        add(text);

        data = new TextField(60);
        add(data);

        Button write_button = new Button("write");
        write_button.addActionListener(new WriteListener(this));
        add(write_button);
        Button read_button = new Button("read");
        read_button.addActionListener(new ReadListener(this));
        add(read_button);

        setSize(470, 300);
        text.setBackground(Color.black);
        show();

        sentence = s;
    }
}


class ReadListener implements ActionListener {
    Irc irc;

    public ReadListener(Irc i) {
        irc = i;
    }

    public void actionPerformed(ActionEvent e) {

        Client client = irc.getClient();

        //consistency protocol for reading
        try {

            //use client interface to request read lock from server
            client.lock_read(irc.sentence.getId());

            //get the stored shared object from client
            Optional<SharedObject> optional = irc.getClient().getSharedObjects()
                    .values()
                    .stream()
                    .filter(o -> o.getId() == irc.sentence.getId())
                    .findAny();

            SharedObject sharedObject = optional.get();
            ObjectState objectState = sharedObject.getObjectState();

            System.out.println("Object state while reading: " + objectState);

            //if the read lock has been taken i.e the object state is in RLT, then proceed with the read protocol
            if (objectState.equals(ObjectState.RLT)) {

                // invoke the method
                String s = ((Sentence) (irc.sentence.getObj())).read();

                System.out.println("reading sentence object: " + s);

                // unlock the object and update it on the server
                SharedObject unlockedObject = irc.sentence.unlock();

                for (Map.Entry<String, SharedObject> sharedObjectEntry : client.getSharedObjects().entrySet()) {

                    if (sharedObjectEntry.getValue().getId() == unlockedObject.getId()) {
                        client.updateSharedObject(sharedObjectEntry.getKey(), unlockedObject);
                    }
                }

                // display the read value
                irc.text.append(s + "\n");
            }

        } catch (RemoteException ex) {
            throw new RuntimeException(ex);

        } catch (SharedObjectNotFoundException ex) {
            System.err.println(ex.message);
        }

    }

}

class WriteListener implements ActionListener {
    Irc irc;

    public WriteListener(Irc i) {
        irc = i;
    }

    public void actionPerformed(ActionEvent e) {

        // get the value to be written from the buffer
        String s = irc.data.getText();

        Client client = irc.getClient();

        //consistency protocol for writing
        try {

            //use client interface to request write lock from server
            client.lock_write(irc.sentence.getId());

            Optional<SharedObject> optional = irc.getClient().getSharedObjects()
                    .values()
                    .stream()
                    .filter(o -> o.getId() == irc.sentence.getId())
                    .findAny();

            SharedObject sharedObject = optional.get();
            ObjectState objectState = sharedObject.getObjectState();

            System.out.println("Object state while writing: " + objectState);

            //if the write lock has been taken i.e the object state is in WLT, then proceed with the write protocol
            if (objectState.equals(ObjectState.WLT)) {

                // invoke the method
                ((Sentence) (irc.sentence.getObj())).write(Irc.myName + " wrote " + s);

                System.out.println(Irc.myName + " wrote " + s);
                irc.data.setText("");

                // unlock the object and update it on the server
                SharedObject unlockedObject = irc.sentence.unlock();

                for (Map.Entry<String, SharedObject> sharedObjectEntry : client.getSharedObjects().entrySet()) {

                    if (sharedObjectEntry.getValue().getId() == unlockedObject.getId()) {
                        client.updateSharedObject(sharedObjectEntry.getKey(), unlockedObject);
                    }
                }

            }

        } catch (RemoteException ex) {
            throw new RuntimeException(ex);

        } catch (SharedObjectNotFoundException ex) {
            System.err.println(ex.message);
        }
    }


}



