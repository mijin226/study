package test1004;

public class GalaxyPhone implements Phone {
	private Watch watch;
	
	public GalaxyPhone() {
		System.out.println("갤럭시 객체 생성 01");
	}
	public GalaxyPhone(Watch watch) {
		this.watch=watch;
		System.out.println("갤럭시 객체 생성 02");
	}

	@Override
	public void powerOn() {
		this.watch.powerOn();
	}
	@Override
	public void powerOff() {
		this.watch.powerOff();
	}	
}
