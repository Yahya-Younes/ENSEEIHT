
public class SharedObjectNotFoundException extends RuntimeException {

    protected String message;

    public SharedObjectNotFoundException(String message) {
        super(message);
        this.message = message;
    }

}
