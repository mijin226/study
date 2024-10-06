package test1002;

public class IPhone implements Phone {
	private Watch watch;
	private int num;
	
	public IPhone() {
		System.out.println("아이폰 객체 생성 01");
	}
//	public IPhone(Watch watch) {
//		this.watch=watch;
//		System.out.println("아이폰 객체 생성 02");
//	}
//	public IPhone(Watch watch, int num) {
//		this.watch=watch;
//		this.num=num;
//		System.out.println("아이폰 객체 생성 03");
//	}

	@Override
	public void powerOn() {
		this.watch.powerOn();
		System.out.println("num = " + this.num);
		System.out.println("아이폰 powerOn()메서드 호출");
	}
	@Override
	public void powerOff() {
		this.watch.powerOff();
		System.out.println("아이폰 powerOff()메서드 호출");
	}	
	public Watch getWatch() {
		return watch;
	}
	public void setWatch(Watch watch) {
		this.watch = watch;
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}	
}
