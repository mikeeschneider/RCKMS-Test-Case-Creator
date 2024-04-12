# Directions

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
