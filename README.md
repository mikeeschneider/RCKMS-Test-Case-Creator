# What is this used for?
This can be used to create test case eCR XML files for testing RCKMS Authoring rules in the Share Service Submission Tool or by adding to the test cases by condition. 


## Directions

1. Use the XML file TEST CASE INFO for TEST CASE CREATOR.xml to fill in information that needs to be contained in the test case eCR.
2. Transform the TEST CASE INFO for TEST CASE CREATOR.xml with the XSL file TEST CASE CREATOR.xsl to create the test case eCR.
3. Save the test case eCR.
4. Rinse and Repeat

## Notes

- If multiple medications, results, or problems need to be added. Duplicate the element and all child elements under sections commented with <!--Duplicate AdministeredMeds block to add more ...-->.
  
Example:
Before Adding more Encounter Diagnoses:
```
  	<EncounterActivity>
		<!--Duplicate EncounterDiagnosis block to add more encounter diagnoses-->
		<EncounterDiagnosis>
			<!--*** Leave code attribute (below) blank (code="") to not show encounter diagnosis ***-->
			<!--Typically uses SNOMEDs-->
			<value code="386661006" displayName="Fever" codeSystem="2.16.840.1.113883.6.96"/>
			<!--Typically uses ICD10-->
			<translation code="" displayName="" codeSystem="2.16.840.1.113883.6.90"/>
		</EncounterDiagnosis>
	</EncounterActivity>
```

 After Adding more Encounter Diagnoses:
 ```
 	<EncounterActivity>
		<!--Duplicate EncounterDiagnosis block to add more encounter diagnoses-->
		<EncounterDiagnosis>
			<!--*** Leave code attribute (below) blank (code="") to not show encounter diagnosis ***-->
			<!--Typically uses SNOMEDs-->
			<value code="386661006" displayName="Fever" codeSystem="2.16.840.1.113883.6.96"/>
			<!--Typically uses ICD10-->
			<translation code="" displayName="" codeSystem="2.16.840.1.113883.6.90"/>
		</EncounterDiagnosis>
    		<EncounterDiagnosis>
			<!--*** Leave code attribute (below) blank (code="") to not show encounter diagnosis ***-->
			<!--Typically uses SNOMEDs-->
			<value code="422400008" displayName="Vomiting" codeSystem="2.16.840.1.113883.6.96"/>
			<!--Typically uses ICD10-->
			<translation code="" displayName="" codeSystem="2.16.840.1.113883.6.90"/>
		</EncounterDiagnosis>
	</EncounterActivity>
```

 - Leaving certain attributes blank will cause sections or elements to not appear. These are noted by comments in the TEST CASE INFO for TEST CASE CREATOR.xml.

Example:

In the example below, the result section can be triggered to display in the eCR XML if the //ResultOrganizer/code/@code attribute is filled and specimen code can be triggered to show in the eCR if the //ResultOrganizer/specimen/@code attribute is filled. If these attributes are left blank, then the section and element will not be displayed in the eCR XML. 
```
   		<ResultOrganizer>
			<!--*** Leave code attribute (below) blank (code="") to not show specimen procedure***-->
			<specimen code="" displayName="" codeSystem="2.16.840.1.113883.6.96"/>
			<!--*** Leave code attribute (below) blank (code="") to not show results***-->
			<code code="" displayName="" codeSystem="2.16.840.1.113883.6.1"/>
			<!--*** If code attribute (below) is left blank (code=""), then value attribute will be displayed***-->
			<value code="" displayName="" codeSystem="2.16.840.1.113883.6.96" value="" unit=""/>
			<interpretationCode code="" displayName="" codeSystem="2.16.840.1.113883.5.83"/>
		</ResultOrganizer>
```
