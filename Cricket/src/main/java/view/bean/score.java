package view.bean;

public class score {
	private int wicket,runball,totaldeliveryface;
	private int runbat,totaldelivery,century,halfcentury,doublecentury;
	private float avg,sr,ec;
	public score() {
		super();	
	}
	public score(int wicket, int runball, int totaldeliveryface,int runbat, int totaldelivery,
			int century, int halfcentury, int doublecentury, float avg, float sr, float ec) {
		super();
		this.wicket = wicket;
		this.runball = runball;
		this.totaldeliveryface = totaldeliveryface;
		this.runbat = runbat;
		this.totaldelivery = totaldelivery;
		this.century = century;
		this.halfcentury = halfcentury;
		this.doublecentury = doublecentury;
		this.avg = avg;
		this.sr = sr;
		this.ec = ec;
	}
	
	public int getWicket() {
		return wicket;
	}
	public void setWicket(int wicket) {
		this.wicket = wicket;
	}
	public int getRunball() {
		return runball;
	}
	public void setRunball(int runball) {
		this.runball = runball;
	}
	public int getTotaldeliveryface() {
		return totaldeliveryface;
	}
	public void setTotaldeliveryface(int totaldeliveryface) {
		this.totaldeliveryface = totaldeliveryface;
	}
	
	public int getRunbat() {
		return runbat;
	}
	public void setRunbat(int runbat) {
		this.runbat = runbat;
	}
	public int getTotaldelivery() {
		return totaldelivery;
	}
	public void setTotaldelivery(int totaldelivery) {
		this.totaldelivery = totaldelivery;
	}
	public int getCentury() {
		return century;
	}
	public void setCentury(int century) {
		this.century = century;
	}
	public int getHalfcentury() {
		return halfcentury;
	}
	public void setHalfcentury(int halfcentury) {
		this.halfcentury = halfcentury;
	}
	public int getDoublecentury() {
		return doublecentury;
	}
	public void setDoublecentury(int doublecentury) {
		this.doublecentury = doublecentury;
	}
	public float getAvg() {
		return avg;
	}
	public void setAvg(float avg) {
		this.avg = avg;
	}
	public float getSr() {
		return sr;
	}
	public void setSr(float sr) {
		this.sr = sr;
	}
	public float getEc() {
		return ec;
	}
	public void setEc(float ec) {
		this.ec = ec;
	}
}
