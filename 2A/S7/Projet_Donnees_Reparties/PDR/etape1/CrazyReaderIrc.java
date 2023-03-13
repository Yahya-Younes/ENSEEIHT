import java.awt.*;
import java.awt.event.*;
import java.rmi.RemoteException;

import javax.swing.JButton;
import javax.swing.JFrame;

public class CrazyReaderIrc extends JFrame {

    private static final long serialVersionUID = 4392468196229185219L;
    public TextArea text;
    public TextField data;
    public static Client client;
    SharedObject_itf sentence;
    static String myName;
    static int flag;

    public static void main(String argv[]) throws RemoteException {

        if (argv.length != 1) {
            System.out.println("java Irc <name>");
            return;
        }
        myName = argv[0];
        // initialize the system
        Client initializedClient = new Client();
        initializedClient.init();
        client = initializedClient;
        // look up the IRC object in the name server
        // if not found, create it, and register it in the name server
        SharedObject_itf s = initializedClient.lookup("CrazyReaderIRC");
		if (s == null) {
            System.out.println("Object with key: 'IRC' not found on server, creating one...");
            s = Client.create(new Sentence());
            client.register("CrazyReaderIRC", s);
            System.out.println("Object with key 'IRC' created on server.");
        }
        // create the graphical part
        new CrazyReaderIrc(s);
    }

    public CrazyReaderIrc(SharedObject_itf s) {

        setLayout(new FlowLayout());

        text = new TextArea(10, 56);
        text.setEditable(false);
        text.setForeground(Color.red);
        add(text);

        data = new TextField(55);
        add(data);

        JButton start_button = new JButton("start");
        start_button.addActionListener(new CrazyReaderStartListener(this,
                start_button));
        add(start_button);

        setSize(470, 300);
        text.setBackground(Color.black);
        setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        sentence = s;
    }
}

class CrazyReaderStartListener implements ActionListener {
    Thread thread;
    CrazyReaderIrc irc;
    JButton start_button;

    public CrazyReaderStartListener(CrazyReaderIrc i, JButton button) {
        irc = i;
        start_button = button;

    }

    public void actionPerformed(ActionEvent e) {

        if (CrazyReaderIrc.flag == 0) {
            start_button.setText("Stop");
            new ActionCrazyReader(irc).start();
        } else {
            CrazyReaderIrc.flag = 0;
            start_button.setText("Start");
        }

    }
}

class ActionCrazyReader extends Thread {

    CrazyReaderIrc irc;

    public ActionCrazyReader(CrazyReaderIrc irc) {
        this.irc = irc;
    }

    @Override
    public void run() {
        CrazyReaderIrc.flag = 1;
        while (CrazyReaderIrc.flag == 1) {
            try {
                sleep(1000 * ((long) Math.random()));
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            // lock the object in read mode
            irc.sentence.lock_read();

            // invoke the method
            String s = ((Sentence) (irc.sentence.getObj())).read();

            // unlock the object
            try {
                irc.sentence.unlock();
            } catch (RemoteException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            // display the read value
            irc.text.append(s + "\n");

        }
    }
}

