import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.UnicastRemoteObject;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public class Server extends UnicastRemoteObject implements Server_itf {

    private ConcurrentMap<String, SharedObject> sharedObjects = new ConcurrentHashMap<>();

    public Server() throws RemoteException {
        super();
    }

    public static void init() {

        try {
            // Create an object of the interface
            Server server = new Server();

            // rmi registry within the server JVM with port number 1900
            LocateRegistry.createRegistry(1900);

            // Binds the remote object by the name 'server'
            Naming.rebind("rmi://localhost:1900" +
                    "/server", server);

            System.out.println("Rmi registry server created on port number 1900");

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
    }

    public static void main(String[] args) {
        init();
    }

    @Override
    public SharedObject lookup(String name) throws RemoteException {
        return sharedObjects.get(name);
    }

    @Override
    public void register(String name, SharedObject_itf so) throws RemoteException {
        sharedObjects.put(name, (SharedObject) so);
    }

    @Override
    public SharedObject create(Object o) throws RemoteException {

        SharedObject so = new SharedObject();
        so.setId(UUID.randomUUID().hashCode());
        so.setObject(o);

        return so;
    }

    @Override
    public Object lock_read(int id, Client_itf client) throws RemoteException {

        //find shared object
        Optional<SharedObject> optional = sharedObjects
                .values()
                .stream()
                .filter(o -> o.getId() == id)
                .findAny();

        if (!optional.isPresent()) {
            throw new SharedObjectNotFoundException("Shared Object Not Found");
        }

        SharedObject sharedObject = optional.get();

        //callbacks to reduce lock and invalidate writer on the client
        client.reduce_lock(sharedObject.getId(), ObjectState.RLT);
        client.invalidate_reader(sharedObject.getId());

        return ObjectState.RLT;
    }

    @Override
    public Object lock_write(int id, Client_itf client) throws RemoteException {

        //find shared object
        Optional<SharedObject> optional = sharedObjects
                .values()
                .stream()
                .filter(o -> o.getId() == id)
                .findAny();

        if (!optional.isPresent()) {
            throw new SharedObjectNotFoundException("Shared Object Not Found");
        }

        SharedObject sharedObject = optional.get();

        //callbacks to reduce lock and invalidate writer on the client
        client.reduce_lock(sharedObject.getId(), ObjectState.WLT);
        client.invalidate_writer(sharedObject.getId());

        return ObjectState.WLT;
    }

    @Override
    public ConcurrentMap<String, SharedObject> getSharedObjects() {
        return sharedObjects;
    }

    @Override
    public void updateSharedObject(String key, SharedObject sharedObject) throws RemoteException {
        sharedObjects.put(key, sharedObject);
    }
}
