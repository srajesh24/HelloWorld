/**
 * Entry point for the HelloWorld Java application.
 *
 * <p>The application writes its greeting to standard output and reports a
 * failure if the output stream could not accept the complete message.</p>
 */
public final class HelloWorld {
    private static final String GREETING = "Hello Rajesh!";

    /**
     * Prevents instantiation of this command-line utility.
     */
    private HelloWorld() {
    }

    /**
     * Runs the application.
     *
     * @param args command-line arguments (not used)
     */
    public static void main(String[] args) {
        try {
            System.out.println(GREETING);

            if (System.out.checkError()) {
                System.err.println("Failed to write greeting to standard output.");
                System.exit(1);
            }
        } catch (SecurityException exception) {
            System.err.println("Unable to access standard output.");
            System.exit(1);
        }
    }
}
