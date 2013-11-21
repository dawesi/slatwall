<!---

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) ten24, LLC
	
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
	
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
	
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this program statically or dynamically with other modules is
    making a combined work based on this program.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
	
    As a special exception, the copyright holders of this program give you
    permission to combine this program with independent modules and your 
    custom code, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting program under terms 
    of your choice, provided that you follow these specific guidelines: 

	- You also meet the terms and conditions of the license of each 
	  independent module 
	- You must not alter the default display of the Slatwall name or logo from  
	  any part of the application 
	- Your custom code must not alter or create any files inside Slatwall, 
	  except in the following directories:
		/integrationServices/

	You may copy and distribute the modified version of this program that meets 
	the above guidelines as a combined work under the terms of GPL for this program, 
	provided that you include the source code of that other code when and as the 
	GNU GPL requires distribution of source code.
    
    If you modify this program, you may extend this exception to your version 
    of the program, but you are not obligated to do so.

Notes:

--->
<cfparam name="rc.sku" type="any" />
<cfparam name="rc.processObject" type="any" />
<cfparam name="rc.edit" type="boolean" />

<cf_HibachiEntityProcessForm entity="#rc.sku#" edit="#rc.edit#">
	
	<cf_HibachiEntityActionBar type="preprocess" object="#rc.sku#">
	</cf_HibachiEntityActionBar>
	
	<cf_HibachiPropertyRow>
		<cf_HibachiPropertyList>
			
			<cfif rc.sku.hasProductSchedule()>
			
				<cf_HibachiPropertyDisplay object="#rc.processObject#" fieldname="editScope" property="editScope" edit="#rc.edit#" valueOptions="#rc.processObject.getEditScopeOptions()#">
				
				<cf_HibachiDisplayToggle selector="select[name='editScope']" loadVisable="yes" showValues="single">
					<cf_HibachiPropertyDisplay object="#rc.sku#" property="eventStartDateTime" edit="#rc.edit#">
					<cf_HibachiPropertyDisplay object="#rc.sku#" property="eventEndDateTime" edit="#rc.edit#">
					<cf_HibachiPropertyDisplay object="#rc.sku#" property="startReservationDateTime" edit="#rc.edit#">
					<cf_HibachiPropertyDisplay object="#rc.sku#" property="endReservationDateTime" edit="#rc.edit#">
				</cf_HibachiDisplayToggle>
				
				<cf_HibachiDisplayToggle selector="select[name='editScope']" loadVisable="no" showValues="all">
					<cf_HibachiPropertyDisplay object="#rc.processObject#" property="eventStartTime" edit="#rc.edit#">
					<cf_HibachiPropertyDisplay object="#rc.processObject#" property="eventEndTime" edit="#rc.edit#">
					<cf_HibachiPropertyDisplay object="#rc.processObject#" property="reservationStartTime" edit="#rc.edit#">
					<cf_HibachiPropertyDisplay object="#rc.processObject#" property="reservationEndTime" edit="#rc.edit#">
				</cf_HibachiDisplayToggle>
			
			<cfelse>
				
				<cf_HibachiPropertyDisplay object="#rc.sku#" property="eventStartDateTime" edit="#rc.edit#">
				<cf_HibachiPropertyDisplay object="#rc.sku#" property="eventEndDateTime" edit="#rc.edit#">
				<cf_HibachiPropertyDisplay object="#rc.sku#" property="startReservationDateTime" edit="#rc.edit#">
				<cf_HibachiPropertyDisplay object="#rc.sku#" property="endReservationDateTime" edit="#rc.edit#">
			
			</cfif>
			
			<cfset locationConfigurationSmartList = $.slatwall.getSmartList("LocationConfiguration") />
			<cfset selectedLocationConfigurationIDs = "" />
			<cfloop array="#rc.sku.getLocationConfigurations()#" index="lc">
				<cfset selectedLocationConfigurationIDs = listAppend(selectedLocationConfigurationIDs, lc.getlocationConfigurationID()) />
			</cfloop>
			<cf_HibachiListingDisplay smartList="#locationConfigurationSmartList#" 
									  multiselectFieldName="locationConfigurations"
									  multiselectPropertyIdentifier="locationConfigurationID" 
									  multiselectValues="#selectedLocationConfigurationIDs#"
									  edit="#rc.edit#">
				<cf_HibachiListingColumn propertyIdentifier="locationPathName" />
				<cf_HibachiListingColumn propertyIdentifier="locationConfigurationName" />
			</cf_HibachiListingDisplay>
			
		</cf_HibachiPropertyList>
	</cf_HibachiPropertyRow>
	
</cf_HibachiEntityProcessForm>
