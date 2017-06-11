package ph.buics.rest;

import java.util.List;
import org.springframework.data.annotation.Id;

public class Employee {
	
	@Id
	String id;
	String serialNo;
	String name;
	String position;
	String department;
	List<Training> trainings;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public List<Training> getTrainings() {
		return trainings;
	}
	public void setTrainings(List<Training> trainings) {
		this.trainings = trainings;
	}
	
	
}
