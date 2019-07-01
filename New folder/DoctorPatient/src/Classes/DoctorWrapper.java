package Classes;

public class DoctorWrapper 
{
	
int id;
	String docname,speciality,address,email,password,contact;
public int getId() 
{
return id;
}
public void setId(int id) 
{
this.id = id;
}
public String getDocname() 
{
return docname;
	}
public void setDocname(String docname)
{
this.docname = docname;
	}
	public String getEmail() 
	{
		return email;
	}
	public void setEmail(String email) 
	{
		this.email = email;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password) 
	{
		this.password = password;
	}
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality)
	{
		this.speciality = speciality;
	}
	public String getContact() 
	{
		return contact;
	}
	public void setContact(String contact) 
	{
		this.contact = contact;
	}
	public void getDoctor(int id,String email)
	{
		this.id=id;
		this.email=email;
	}
	
}

