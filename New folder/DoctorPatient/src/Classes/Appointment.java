package Classes;

public class Appointment {


	private int age,ap_id;
	private String name,contact,speciality,appointmentdate,description,email,docname,slot,doc_id;
	public int getApid() {
		return ap_id;
	}
	public void setApid(int ap_id) {
		this.ap_id = ap_id;
	}
	
	public String getDocid() {
		return doc_id;
	}
	public void setDocid(String doc_id) {
		this.doc_id = doc_id;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	public String getDay() {
		return appointmentdate;
	}
	public void setDay(String appointmentdate) {
		this.appointmentdate = appointmentdate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getDocname() {
		return docname;
	}
	public void setDocname(String docname) {
		this.docname = docname;
	}
	public String getSlot() {
		return slot;
	}
	public void setSlot(String slot) {
		this.slot = slot;
	}
}
