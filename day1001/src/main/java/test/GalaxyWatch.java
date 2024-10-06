package test;

public class GalaxyWatch implements Watch {
	public GalaxyWatch() {
		System.out.println("갤럭시워치 생성자 호출");
	}
	@Override
	public void powerOn() {
		System.out.println("갤럭시워치로 ON");		
	}

	@Override
	public void powerOff() {
		System.out.println("갤럭시워치로 OFF");		
	}
}
