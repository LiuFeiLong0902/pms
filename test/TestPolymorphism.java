import org.junit.Test;

public class TestPolymorphism {

	@Test
	public void testPolymorphism() {
		new Son1();
		new Son2();
	}

}

class Father {
	int i = 5;

	public Father() {
		this.show();
	}

	public void show() {
		System.out.println("父");
	}
}

class Son1 extends Father {
	int i = 10;

	public void show() {
		System.out.println(i);
	}
}

class Son2 extends Father {
	public void show() {
		System.out.println(i);
	}
}