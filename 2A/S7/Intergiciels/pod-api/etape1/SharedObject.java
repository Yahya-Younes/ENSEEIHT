import java.io.Serializable;
import java.rmi.RemoteException;
import java.util.Map;
import java.util.Optional;

public class SharedObject implements Serializable, SharedObject_itf {
    private int id;

    private ObjectState objectState = ObjectState.NL;

    public Object obj;

    @Override
    public int getId() {
        return id;
    }

    @Override
    public Object getObj() {
        return obj;
    }

    public ObjectState getObjectState() {
        return objectState;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public void setObject(Object o) {
        this.obj = o;
    }

    // invoked by the user program on the client node
    @Override
    public void lock_read() {
    }

    // invoked by the user program on the client node
    @Override
    public void lock_write() {
    }

    @Override
    // invoked by the user program on the client node
    public synchronized SharedObject unlock() throws RemoteException {

        //if read lock was taken release it and switch to the cached state
        if (objectState.equals(ObjectState.RLT) || objectState.equals(ObjectState.RLT_WLC)) {
            objectState = ObjectState.RLC;
        }

        //if write lock was taken release it and switch to the cached state
        if (objectState.equals(ObjectState.WLT)) {
            objectState = ObjectState.WLC;
        }

        return this;
    }

    @Override
    // callback invoked remotely by the server
    public synchronized Object reduce_lock(ObjectState objectState) {
        this.objectState = objectState;
        return this.objectState;
    }

    // callback invoked remotely by the server
    public synchronized void invalidate_reader() {
    }

    public synchronized Object invalidate_writer() {
        return null;
    }
}
