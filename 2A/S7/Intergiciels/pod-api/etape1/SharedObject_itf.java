import java.rmi.RemoteException;

public interface SharedObject_itf {

    public void lock_read();

    public void lock_write();

    public SharedObject unlock() throws RemoteException;

    int getId();

    Object getObj();

    void setId(int hashCode);

    void setObject(Object o);

    // callback invoked remotely by the server
    Object reduce_lock(ObjectState objectState);
}