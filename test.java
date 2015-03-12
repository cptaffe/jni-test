
public class test {

	// load appropriate library for native interface.
	static {
		System.loadLibrary("test");
	}

	private native double average(int n1, int n2);

	public static void main(String args[]) {
		java.io.PrintStream out = System.out;
		out.append("hello\n");
		test test = new test();
		test.average(1,2);
	}
}
