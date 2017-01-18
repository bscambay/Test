package gov.ssa.gold.workflow;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="workflow")
public class WorkflowX implements Serializable
{
	private static final long serialVersionUID = -4805173183653649376L;

	@Id
	@SequenceGenerator(name="workflow_workflow_id_seq", sequenceName="workflow_workflow_id_seq", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="workflow_workflow_id_seq")
	@Column(name="workflow_id", updatable=false)
	private Long id;
	
	private String name;
	
	private String description;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() 
	{
		return String.format("ID: %d, Name: %s, Description: %s", 
				this.id, this.name, this.description);
	}
}