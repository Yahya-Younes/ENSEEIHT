public class Sentence_stub extends SharedObject implements Sentence_itf, java.io.Serializable {

    public Sentence_stub(){
        obj = new Sentence();
    }
    public void write(String text) {
        Sentence s = (Sentence) obj;
        s.write(text);
    }

    public String read() {
        Sentence s = (Sentence) obj;
        return s.read();
    }

}