package vn.edu.hcmuaf.fit.laptrinhweb.model;

import java.io.Serializable;
import java.sql.Date;

public class Slide extends AbsModel  implements Serializable {
	private String id;
	private String image;
	private String note;
	private String greetingH2;
	private String greetingSpan;
	private String greetingP ;
	private boolean active;

	public Slide() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getGreetingH2() {
		return greetingH2;
	}

	public void setGreetingH2(String greetingH2) {
		this.greetingH2 = greetingH2;
	}

	public String getGreetingSpan() {
		return greetingSpan;
	}

	public void setGreetingSpan(String greetingSpan) {
		this.greetingSpan = greetingSpan;
	}

	public String getGreetingP() {
		return greetingP;
	}

	public void setGreetingP(String greetingP) {
		this.greetingP = greetingP;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "Slide{" +
				"id='" + id + '\'' +
				", image='" + image + '\'' +
				", note='" + note + '\'' +
				", greetingH2='" + greetingH2 + '\'' +
				", greetingSpan='" + greetingSpan + '\'' +
				", greetingP='" + greetingP + '\'' +
				", active=" + active +
				'}';
	}
}
