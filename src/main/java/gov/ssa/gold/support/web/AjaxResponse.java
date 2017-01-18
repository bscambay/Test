/**
 * 
 */
package gov.ssa.gold.support.web;

import java.io.Serializable;

/**
 * @author Chris Vaughan
 *
 */
public class AjaxResponse implements Serializable 
{
	private static final long serialVersionUID = 7136694208708711620L;
	private static final String RESULT_SUCCESS = "success";
	
	private String result = RESULT_SUCCESS;
	private String action = "Ajax Action";
	
	public AjaxResponse()
	{
		
	}
	
	public AjaxResponse(String action)
	{
		this.action = action;
	}
	
	public AjaxResponse(String action, String result)
	{
		this.action = action;
		this.result = result;
	}

	/**
	 * @return the result
	 */
	public String getResult() 
	{
		return result;
	}

	/**
	 * @param result the result to set
	 */
	public void setResult(String result)
	{
		this.result = result;
	}

	/**
	 * @return the action
	 */
	public String getAction() 
	{
		return action;
	}

	/**
	 * @param action the action to set
	 */
	public void setAction(String action) 
	{
		this.action = action;
	}
}