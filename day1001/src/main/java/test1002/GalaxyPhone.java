package test1002;

public class GalaxyPhone implements Phone { //인터페이스 활용
	private Watch watch; //new 하는 객체 멤버변수 설정
	
	public GalaxyPhone() { //기본생성자의 new 제거
		System.out.println("갤럭시 객체 생성 01");
	}
//	public GalaxyPhone(Watch watch) { //멤버변수 인자값으로 사용하는 생성자 추가
//		this.watch=watch;
//		System.out.println("갤럭시 객체 생성 02");
//	}
	@Override
	public void powerOn() {
		this.watch.powerOn();
		System.out.println("갤럭시 powerOn()메서드 호출");
	}
	@Override
	public void powerOff() {
		this.watch.powerOff();
		System.out.println("갤럭시 powerOff()메서드 호출");
	}
	public Watch getWatch() {
		return watch;
	}
	public void setWatch(Watch watch) {
		this.watch = watch;
	}	
}
