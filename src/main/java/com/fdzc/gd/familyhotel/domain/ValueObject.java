/**
 * 
 */
package com.fdzc.gd.familyhotel.domain;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

/**
 *
 * domain,pojo(plain old java object),bean
 * @author Miracle_Q
 *
 */
public class ValueObject {

	@Override
	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}
	    
}
