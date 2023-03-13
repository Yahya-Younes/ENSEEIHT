import java.rmi.RemoteException;
import java.util.Map;
import java.util.concurrent.ConcurrentMap;

public interface Server_itf extends java.rmi.Remote {

    public SharedObject lookup(String name) throws java.rmi.RemoteException;

    void register(String name, SharedObject_itf so) throws RemoteException;

    public SharedObject create(Object o) throws java.rmi.RemoteException;

    public Object lock_read(int id, Client_itf client) throws java.rmi.RemoteException;

    public Object lock_write(int id, Client_itf client) throws java.rmi.RemoteException;

    ConcurrentMap<String,SharedObject> getSharedObjects() throws java.rmi.RemoteException;

    void updateSharedObject(String key, SharedObject sharedObject) throws java.rmi.RemoteException;
}
