import java.awt.*;
import java.awt.event.*;

import javax.swing.JButton;
import javax.swing.JFrame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.rmi.RemoteException;
import java.util.Map;
import java.util.Optional;

/**
 * @author yzimero
 * 
 */
public class CrazyWriterIrc extends JFrame {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4392468196229185219L;
	SharedObject_itf sentence;
	static String myName;
    public static Client client;
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
		SharedObject_itf s = initializedClient.lookup("CrazyWriterIRC");
		if (s == null) {
            System.out.println("Object with key: 'IRC' not found on server, creating one...");
            s = client.create(new Sentence());
            client.register("CrazyWriterIRC", s);
            System.out.println("Object with key 'IRC' created on server.");
        }
		// create the graphical part
		new CrazyWriterIrc(s);
	}
    
    public Client getClient() {
        return client;
    }
	public CrazyWriterIrc(SharedObject_itf s) {

		setLayout(new FlowLayout());

		JButton start_button = new JButton("start");

		start_button.addActionListener(new CrazyWriterStartListener(this,
				start_button));
		add(start_button);

		setSize(470, 300);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		sentence = s;
	}
}

class CrazyWriterStartListener implements ActionListener {
	Thread thread;
	CrazyWriterIrc irc;
	JButton start_button;

	public CrazyWriterStartListener(CrazyWriterIrc i, JButton button) {
		irc = i;
		start_button = button;

	}

	public void actionPerformed(ActionEvent e) {
		if (CrazyWriterIrc.flag == 0) {
			start_button.setText("Stop");
			new ActionCrazyWritter(irc).start();
		} else {
			CrazyWriterIrc.flag = 0;
			start_button.setText("Start");
		}
	}
}

class ActionCrazyWritter extends Thread {

	CrazyWriterIrc irc;

	public ActionCrazyWritter(CrazyWriterIrc irc) {
		this.irc = irc;
	}

	@Override
	public void run() {
		CrazyWriterIrc.flag = 1;
		int i = 0;
		while (CrazyWriterIrc.flag == 1) {
			try {
				sleep(1000 * ((long) Math.random()));
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

				// lock the object in write mode
				irc.sentence.lock_write();

				// invoke the method
				((Sentence) (irc.sentence.getObj())).write(CrazyWriterIrc.myName
						+ " wrote " + i++);

				// unlock the object
				//System.out.println(i);
                try {
                    irc.sentence.unlock();
                } catch (RemoteException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
		}
	}
}
