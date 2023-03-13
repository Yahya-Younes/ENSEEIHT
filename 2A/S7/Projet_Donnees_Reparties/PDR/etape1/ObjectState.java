public enum ObjectState {

    NL("NL"),
    RLC("RLC"),
    WLC("WLC"),
    RLT("RLT"),
    WLT("WLT"),
    RLT_WLC("RLT_WLC");
    private final String objectState;

    ObjectState(String objectState){
        this.objectState = objectState;
    }
}
