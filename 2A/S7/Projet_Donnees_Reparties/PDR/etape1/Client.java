import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.registry.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.ConcurrentMap;

public class Client extends UnicastRemoteObject implements Client_itf {

    private static Server_itf server;

    public Client() throws RemoteException {
        super();
    }

    public ConcurrentMap<String, SharedObject> getSharedObjects() throws RemoteException {
        return server.getSharedObjects();
    }

    public void updateSharedObject(String key, SharedObject sharedObject) throws RemoteException {
        server.updateSharedObject(key, sharedObject);
    }

///////////////////////////////////////////////////
//         Interface to be used by applications
///////////////////////////////////////////////////

    // initialization of the client layer
    public void init() {

        try {
            // lookup method to find reference of remote server object
            server = (Server_itf) Naming.lookup("rmi://localhost:1900" +
                    "/server");

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
    }

    // lookup in the name server
    public SharedObject lookup(String name) {

        try {
            return server.lookup(name);

        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
    }

    // binding in the name server
    public void register(String name, SharedObject_itf so) throws RemoteException {
        server.register(name, so);
    }

    // creation of a shared object
    public static SharedObject create(Object o) throws RemoteException {
        return server.create(o);
    }

/////////////////////////////////////////////////////////////
//    Interface to be used by the consistency protocol
////////////////////////////////////////////////////////////

    // request a read lock from the server
    public Object lock_read(int id) throws RemoteException {
        return server.lock_read(id, this);
    }

    // request write lock from the server
    public Object lock_write(int id) throws RemoteException {
        return server.lock_write(id, this);
    }

    // receive a lock reduction request from the server
    @Override
    public Object reduce_lock(int id, ObjectState objectState) throws java.rmi.RemoteException {

        //find shared object on server
        Optional<SharedObject> optional = getSharedObjects()
                .values()
                .stream()
                .filter(o -> o.getId() == id)
                .findAny();

        if (!optional.isPresent()) {
            throw new SharedObjectNotFoundException("Shared Object Not Found");
        }

        SharedObject sharedObject = optional.get();

        ObjectState initialObjectState = sharedObject.getObjectState();

        List<ObjectState> noLockOrCachedLockOrHybridLockStates
                = Arrays.asList(ObjectState.NL, ObjectState.RLC, ObjectState.WLC, ObjectState.RLT_WLC);

        //if server is trying to do a read lock
        if (objectState.equals(ObjectState.RLT)) {

            //update object state if it is in No Lock or a Cached Lock State
            if (noLockOrCachedLockOrHybridLockStates.contains(initialObjectState)) {

                //if state was initially in a cached write lock, reduce to a hybrid state
                if (initialObjectState.equals(ObjectState.WLC)) {
                    sharedObject.reduce_lock(ObjectState.RLT_WLC);
                    System.out.println();
                    System.out.println("Hybrid Lock gotten: " + sharedObject.getObjectState());

                } else {
                    sharedObject.reduce_lock(objectState);
                    System.out.println();
                    System.out.println("Read Lock gotten: " + sharedObject.getObjectState());
                }

                //update shared object on the server
                for (Map.Entry<String, SharedObject> sharedObjectEntry : getSharedObjects().entrySet()) {

                    if (sharedObjectEntry.getValue().getId() == sharedObject.getId()) {
                        this.updateSharedObject(sharedObjectEntry.getKey(), sharedObject);
                    }
                }

            } else {
                System.err.println("Shared Object is currently in a Lock: "
                        + initialObjectState);
            }
        }

        //if server is trying to get a write lock
        if (objectState.equals(ObjectState.WLT)) {

            //update object state if it is in No Lock or a Cached Lock State
            if (noLockOrCachedLockOrHybridLockStates.contains(initialObjectState)) {

                sharedObject.reduce_lock(objectState);
                System.out.println();
                System.out.println("Write Lock gotten: " + sharedObject.getObjectState());

                //update shared object on the server
                for (Map.Entry<String, SharedObject> sharedObjectEntry : getSharedObjects().entrySet()) {

                    if (sharedObjectEntry.getValue().getId() == sharedObject.getId()) {
                        this.updateSharedObject(sharedObjectEntry.getKey(), sharedObject);
                    }
                }

            } else {
                System.err.println("Shared Object is currently in a Lock: "
                        + initialObjectState);
            }
        }

        return sharedObject.getObjectState();
    }


    // receive a reader invalidation request from the server
    public void invalidate_reader(int id) throws java.rmi.RemoteException {

        Optional<SharedObject> optional = getSharedObjects()
                .values()
                .stream()
                .filter(o -> o.getId() == id)
                .findAny();

        if (!optional.isPresent()) {
            throw new SharedObjectNotFoundException("Shared Object Not Found");
        }

        SharedObject sharedObject = optional.get();
        sharedObject.invalidate_reader();
    }


    // receive a writer invalidation request from the server
    public Object invalidate_writer(int id) throws java.rmi.RemoteException {


        Optional<SharedObject> optional = getSharedObjects()
                .values()
                .stream()
                .filter(o -> o.getId() == id)
                .findAny();

        if (!optional.isPresent()) {
            throw new SharedObjectNotFoundException("Shared Object Not Found");
        }

        SharedObject sharedObject = optional.get();
        return sharedObject.invalidate_writer();
    }

}
