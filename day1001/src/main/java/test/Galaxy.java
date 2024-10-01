package test;

	public class Galaxy implements Phone {
		public Galaxy() {
			System.out.println("갤럭시 객체 생성");
		}
		@Override
		public void powerOn() {
			System.out.println("갤럭시 전원 ON");
		}
		@Override
		public void powerOff() {
			System.out.println("갤럭시 전원 OFF");
		}
}
