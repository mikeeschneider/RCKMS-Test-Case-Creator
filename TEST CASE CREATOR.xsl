<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<ClinicalDocument xmlns:sdtc="urn:hl7-org:sdtc" xmlns:cda="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:voc="http://www.lantanagroup.com/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="US"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_HD000040">
				<!--[C-CDA R1.1] US Realm Header-->
			</typeId>
			<templateId root="2.16.840.1.113883.10.20.22.1.1">
				<!-- [C-CDA R2.1] US Realm Header (V3) -->
			</templateId>
			<templateId root="2.16.840.1.113883.10.20.22.1.1" extension="2015-08-01">
				<!--[eICR R2 STU1.1] Initial Public Health Case Report Document (eICR) (V2) -->
			</templateId>
			<templateId root="2.16.840.1.113883.10.20.15.2" extension="2016-12-01"/>
			<id root="e32f8595-0cc0-402f-913d-ebb8190f5731">
				<!--Globally unique document ID (extension) is scoped by vendor/software-->
			</id>
			<code code="55751-2" displayName="Public Health Case Report" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
				<!--Document Code-->
			</code>
			<title>Initial Public Health Case Report</title>
			<effectiveTime value="{/data/effectiveTime/effectiveTimeWithTime/@value}"/>
			<confidentialityCode code="N" displayName="Normal" codeSystem="2.16.840.1.113883.5.25"/>
			<languageCode code="en-US"/>
			<recordTarget>
				<!--******************************************************** recordTarget: The patient ********************************************************-->
				<patientRole>
					<id extension="PT-471325" root="2.16.840.1.113883.19.5">
						<!--Patient ID-->
					</id>
					<!--
        ********************************************************
        TO CUSTOMIZE eICR FOR YOUR JURISDICTION, EDIT PATIENT ADDRESS FIELDS BELOW

        Fields currently populated with example address information from HL7 eICR 1.1 samples. 
        ********************************************************
        -->
					<addr use="H">
						<streetAddressLine>
							<xsl:value-of select="/data/patient/streetAddressLine/@value"/>
						</streetAddressLine>
						<city>
							<xsl:value-of select="/data/patient/city/@value"/>
						</city>
						<state>
							<xsl:value-of select="/data/patient/state/@value"/>
						</state>
						<postalCode>
							<xsl:value-of select="/data/patient/postalCode/@value"/>
						</postalCode>
						<county>
							<xsl:value-of select="/data/patient/county/@value"/>
						</county>
						<country>
							<xsl:value-of select="/data/patient/country/@value"/>
						</country>
					</addr>
					<!--
        ********************************************************
        TO CUSTOMIZE eICR FOR YOUR JURISDICTION, EDIT PATIENT ADDRESS FIELDS ABOVE

        Fields currently populated with example address information from HL7 eICR 1.1 samples.
        ********************************************************
        -->
					<telecom use="HP" value="{/data/patient/telecomHP/@value}"/>
					<telecom use="HP" value="{/data/patient/telecomMail/@value}"/>
					<patient>
						<name use="L">
							<given>
								<xsl:value-of select="/data/patient/given/@value"/>
							</given>
							<family>
								<xsl:value-of select="/data/patient/family/@value"/>
							</family>
						</name>
						<administrativeGenderCode code="{/data/patient/adminGenderCode/@code}" codeSystem="2.16.840.1.113883.5.1" displayName="{/data/patient/adminGenderCode/@displayName}"/>
						<birthTime value="{/data/patient/DOB/@value}"/>
						<sdtc:deceasedInd value="{/data/patient/deceasedInd/@value}"/>
						<xsl:if test="/data/patient/deceasedInd/@value = 'true'">
							<sdtc:deceasedTime value="{/data/patient/deceasedTime/@value}"/>
						</xsl:if>
						<raceCode code="{/data/patient/raceCode/@code}" displayName="{/data/patient/raceCode/@displayName}" codeSystem="2.16.840.1.113883.6.238" codeSystemName="Race &amp; Ethnicity - CDC"/>
						<xsl:if test="not(/data/patient/sdtcRaceCode/@code = '')">
							<sdtc:raceCode code="{/data/patient/sdtcRaceCode/@code}" displayName="{/data/patient/sdtcRaceCode/@displayName}" codeSystem="2.16.840.1.113883.6.238" codeSystemName="Race &amp; Ethnicity - CDC"/>
						</xsl:if>
						<ethnicGroupCode code="{/data/patient/ethnicGroupCode/@code}" displayName="{/data/patient/ethnicGroupCode/@displayName}" codeSystem="2.16.840.1.113883.6.238" codeSystemName="Race &amp; Ethnicity - CDC"/>
						<xsl:if test="not(/data/patient/sdtcEthnicGroupCode/@code = '')">
							<sdtc:ethnicGroupCode code="{/data/patient/sdtcEthnicGroupCode/@code}" displayName="{/data/patient/sdtcEthnicGroupCode/@displayName}" codeSystem="2.16.840.1.113883.6.238" codeSystemName="Race &amp; Ethnicity - CDC"/>
						</xsl:if>
						<languageCommunication>
							<languageCode code="en"/>
							<preferenceInd value="true"/>
						</languageCommunication>
					</patient>
				</patientRole>
			</recordTarget>
			<author>
				<!--Author/authenticator may be software or may be a provider such as "infection control professional"-->
				<time value="{/data/effectiveTime/effectiveTimeWithTime/@value}"/>
				<assignedAuthor>
					<id root="2.16.840.1.113883.3.72.5.20"/>
					<!--Example address from HL7 eICR 1.1 samples - not used by RCKMS -->
					<addr use="WP">
						<streetAddressLine>
							<xsl:value-of select="/data/author/streetAddressLine/@value"/>
						</streetAddressLine>
						<city>
							<xsl:value-of select="/data/author/city/@value"/>
						</city>
						<state>
							<xsl:value-of select="/data/author/state/@value"/>
						</state>
						<postalCode>
							<xsl:value-of select="/data/author/postalCode/@value"/>
						</postalCode>
						<county>
							<xsl:value-of select="/data/author/county/@value"/>
						</county>
						<country>
							<xsl:value-of select="/data/author/country/@value"/>
						</country>
					</addr>
					<telecom use="WP" value="{/data/author/telecomHP/@value}"/>
					<telecom use="WP" value="{/data/author/telecomFax/@value}"/>
					<assignedAuthoringDevice>
						<manufacturerModelName displayName="TBD Device"/>
						<softwareName/>
					</assignedAuthoringDevice>
				</assignedAuthor>
			</author>
			<custodian>
				<assignedCustodian>
					<representedCustodianOrganization>
						<id extension="TBDFacility#" root="2.16.840.1.113883.4.6">
							<!--Custodian ID-->
						</id>
						<name>
							<xsl:value-of select="/data/custodian/name/@value"/>
						</name>
						<telecom use="WP" value="{/data/custodian/telecomHP/@value}"/>
						<!--Example address from HL7 eICR 1.1 samples - not used by RCKMS -->
						<addr>
							<streetAddressLine>
								<xsl:value-of select="/data/custodian/streetAddressLine/@value"/>
							</streetAddressLine>
							<city>
								<xsl:value-of select="/data/custodian/city/@value"/>
							</city>
							<state>
								<xsl:value-of select="/data/custodian/state/@value"/>
							</state>
							<postalCode>
								<xsl:value-of select="/data/custodian/postalCode/@value"/>
							</postalCode>
							<country>
								<xsl:value-of select="/data/custodian/country/@value"/>
							</country>
						</addr>
					</representedCustodianOrganization>
				</assignedCustodian>
			</custodian>
			<!--******************************************************** componentOf: contains the encompassingEncouter and the provider and facility infomation for the case ********************************************************-->
			<componentOf>
				<encompassingEncounter>
					<id extension="9937012" root="2.16.840.1.113883.19">
						<!--encounter ID-->
					</id>
					<code code="{/data/encounter/code/@value}" displayName="{/data/encounter/code/@displayName}" codeSystem="{/data/encounter/code/@codeSystem}"/>
					<effectiveTime>
						<low value="{/data/encounter/effectiveTimeLow/@value}"/>
						<xsl:if test="not(/data/encounter/effectiveTimeHigh/@value = '')">
							<high value="{/data/encounter/effectiveTimeHigh/@value}"/>
						</xsl:if>
					</effectiveTime>
					<responsibleParty>
						<assignedEntity>
							<id root="2.16.840.1.113883.4.6" extension="66666666666">
								<!--Provider ID-->
							</id>
							<!--Example address from HL7 eICR 1.1 samples - not used by RCKMS -->
							<addr>
								<streetAddressLine>
									<xsl:value-of select="/data/encounter/streetAddressLine/@value"/>
								</streetAddressLine>
								<city>
									<xsl:value-of select="/data/encounter/city/@value"/>
								</city>
								<state>
									<xsl:value-of select="/data/encounter/state/@value"/>
								</state>
								<postalCode>
									<xsl:value-of select="/data/encounter/postalCode/@value"/>
								</postalCode>
								<country>
									<xsl:value-of select="/data/encounter/country/@value"/>
								</country>
							</addr>
							<telecom use="WP" value="{/data/encounter/telecomHP/@value}"/>
							<telecom use="WP" value="{/data/encounter/telecomFax/@value}"/>
							<assignedPerson>
								<name>
									<given>Assigned</given>
									<family>Amanda</family>
									<suffix/>
								</name>
							</assignedPerson>
							<representedOrganization>
								<id extension="TBDFacility#" root="2.16.840.1.113883.4.6">
									<!--Represented Organization-->
								</id>
								<name>
									<xsl:value-of select="/data/encounter/name/@value"/>
								</name>
								<!--Example address from HL7 eICR 1.1 samples - not used by RCKMS -->
								<addr>
									<streetAddressLine>
										<xsl:value-of select="/data/encounter/streetAddressLine/@value"/>
									</streetAddressLine>
									<city>
										<xsl:value-of select="/data/encounter/city/@value"/>
									</city>
									<state>
										<xsl:value-of select="/data/encounter/state/@value"/>
									</state>
									<postalCode>
										<xsl:value-of select="/data/encounter/postalCode/@value"/>
									</postalCode>
									<country>
										<xsl:value-of select="/data/encounter/country/@value"/>
									</country>
								</addr>
							</representedOrganization>
						</assignedEntity>
					</responsibleParty>
					<location>
						<healthCareFacility>
							<id extension="2783" root="2.16.840.1.113883.4.6">
								<!--Facility ID-->
							</id>
							<code code="{/data/encounter/codeHCF/@value}" codeSystem="{/data/encounter/codeHCF/@codeSystem}" displayName="{/data/encounter/codeHCF/@displayName}"/>
							<!--
        ********************************************************
        TO CUSTOMIZE eICR FOR YOUR JURISDICTION, EDIT FACILITY ADDRESS FIELDS BELOW
        
        Fields currently populated with example address information from HL7 eICR 1.1 samples. 
        ********************************************************
        -->
							<location>
								<addr use="WP">
									<streetAddressLine>
										<xsl:value-of select="/data/encounter/streetAddressLineHCF/@value"/>
									</streetAddressLine>
									<city>
										<xsl:value-of select="/data/encounter/cityHCF/@value"/>
									</city>
									<state>
										<xsl:value-of select="/data/encounter/stateHCF/@value"/>
									</state>
									<postalCode>
										<xsl:value-of select="/data/encounter/postalCodeHCF/@value"/>
									</postalCode>
									<country>
										<xsl:value-of select="/data/encounter/countryHCF/@value"/>
									</country>
								</addr>
							</location>
							<!--
        ********************************************************
        TO CUSTOMIZE eICR FOR YOUR JURISDICTION, EDIT FACILITY ADDRESS FIELDS ABOVE
        
        Fields currently populated with example address information from HL7 eICR 1.1 samples. 
        ********************************************************
        -->
							<serviceProviderOrganization>
								<name>
									<xsl:value-of select="/data/encounter/nameHCF/@value"/>
								</name>
								<telecom use="WP" value="{/data/encounter/telecomHPHCF/@value}"/>
								<telecom use="WP" value="{/data/encounter/telecomFaxHCF/@value}"/>
								<!--Example address from HL7 eICR 1.1 samples - not used by RCKMS -->
								<addr>
									<streetAddressLine>
										<xsl:value-of select="/data/encounter/streetAddressLineHCF/@value"/>
									</streetAddressLine>
									<city>
										<xsl:value-of select="/data/encounter/cityHCF/@value"/>
									</city>
									<state>
										<xsl:value-of select="/data/encounter/stateHCF/@value"/>
									</state>
									<postalCode>
										<xsl:value-of select="/data/encounter/postalCodeHCF/@value"/>
									</postalCode>
									<country>
										<xsl:value-of select="/data/encounter/countryHCF/@value"/>
									</country>
								</addr>
							</serviceProviderOrganization>
						</healthCareFacility>
					</location>
				</encompassingEncounter>
			</componentOf>
			<component>
				<structuredBody>
					<!--******************************************************** Encounters Section ********************************************************-->
					<component>
						<section>
							<!--[C-CDA R1.1] Encounters Section (entries optional)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.22"/>
							<!--[C-CDA R2.1] Encounters Section (entries optional) (V3)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.22" extension="2015-08-01"/>
							<templateId root="2.16.840.1.113883.10.20.22.2.22.1"/>
							<!-- [C-CDA R2.1] Encounters Section (entries required) (V3)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.22.1" extension="2015-08-01"/>
							<code code="46240-8" displayName="History of encounters" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>Encounters</title>
							<text>
						
					</text>
							<entry typeCode="DRIV">
								<!---->
								<encounter moodCode="EVN" classCode="ENC">
									<!--[C-CDA R1.1] Encounter Activities-->
									<templateId root="2.16.840.1.113883.10.20.22.4.49"/>
									<!--[C-CDA R2.1] Encounter Activities (V3)-->
									<templateId root="2.16.840.1.113883.10.20.22.4.49" extension="2015-08-01"/>
									<id root="12be0090-6859-4e58-a536-00b5b77b75ba"/>
									<code code="{/data/encounterSection/code/@value}" displayName="{/data/encounterSection/code/@displayName}" codeSystem="{/data/encounterSection/code/@codeSystem}"/>
									<effectiveTime value="{/data/effectiveTime/effectiveTimes/@value}"/>
									<xsl:for-each select="/data/EncounterActivity/EncounterDiagnosis">
										<xsl:if test="not(value/@code = '')">
											<entryRelationship typeCode="SUBJ">
												<act classCode="ACT" moodCode="EVN">
													<templateId root="2.16.840.1.113883.10.20.22.4.80"/>
													<templateId extension="2015-08-01" root="2.16.840.1.113883.10.20.22.4.80"/>
													<id extension="299999999-311111-concern" root="1.2.840.114350.1.13.000.2.7.1.1000.1"/>
													<code code="29308-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Diagnosis"/>
													<statusCode code="active"/>
													<entryRelationship inversionInd="false" typeCode="SUBJ">
														<observation classCode="OBS" moodCode="EVN">
															<templateId root="2.16.840.1.113883.10.20.22.4.4"/>
															<templateId extension="2015-08-01" root="2.16.840.1.113883.10.20.22.4.4"/>
															<id extension="299999999-311111" root="1.2.840.114350.1.13.000.2.7.1.1000.1"/>
															<code code="282291009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
																<translation code="29308-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Diagnosis"/>
															</code>
															<statusCode code="completed"/>
															<effectiveTime>
																<low value="{/data/effectiveTime/effectiveTimes/@value}"/>
															</effectiveTime>
															<value xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" code="{value/@code}" codeSystem="{value/@codeSystem}" displayName="{value/@displayName}" xsi:type="CD">
																<originalText>
																	<xsl:value-of select="value/@displayName"/>
																</originalText>
																<translation code="{translation/@code}" codeSystem="{translation/@codeSystem}" displayName="{translation/@displayName}"/>
															</value>
														</observation>
													</entryRelationship>
												</act>
											</entryRelationship>
										</xsl:if>
									</xsl:for-each>
								</encounter>
							</entry>
						</section>
					</component>
					<!--******************************************************** History of Present Illness Section ********************************************************-->
					<component>
						<section nullFlavor="NI">
							<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.4"/>
							<code code="10164-2" displayName="History of Present Illness" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>History of Present Illness</title>
							<text>No history of present illness</text>
						</section>
					</component>
					<!--******************************************************** Medications Administered Section ********************************************************-->
					<component>
						<section nullFlavor="NI">
							<!--[C-CDA R1.1] Medications Administered Section-->
							<templateId root="2.16.840.1.113883.10.20.22.2.38"/>
							<!--[C-CDA R2.0] Medications Administered Section (V2) -->
							<templateId root="2.16.840.1.113883.10.20.22.2.38" extension="2014-06-09"/>
							<code code="29549-3" displayName="Medications Administered" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>Medications Administered</title>
							<text/>
							<xsl:for-each select="/data/Medication/AdministeredMeds">
								<xsl:if test="not(code/@code = '')">
									<entry>
										<substanceAdministration classCode="SBADM" moodCode="EVN">
											<templateId root="2.16.840.1.113883.10.20.22.4.16"/>
											<templateId extension="2014-06-09" root="2.16.840.1.113883.10.20.22.4.16"/>
											<id extension="831293486" root="1.2.840.114350.1.13.000.2.7.2.777777"/>
											<text>
												<xsl:value-of select="medtext/@value"/>
											</text>
											<statusCode code="completed"/>
											<effectiveTime xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="IVL_TS">
												<low value="{/data/effectiveTime/effectiveTimeWithTime/@value}"/>
											</effectiveTime>
											<effectiveTime xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" institutionSpecified="false" operator="A" xsi:type="PIVL_TS">
												<period unit="h" value="6"/>
											</effectiveTime>
											<routeCode code="{routeCode/@code}" codeSystem="{routeCode/@codeSystem}" codeSystemName="NCI Thesaurus" displayName="{routeCode/@displayName}"/>
											<doseQuantity unit="{doseQuantity/@unit}" value="{doseQuantity/@value}"/>
											<consumable typeCode="CSM">
												<manufacturedProduct classCode="MANU">
													<templateId root="2.16.840.1.113883.10.20.22.4.23"/>
													<templateId extension="2014-06-09" root="2.16.840.1.113883.10.20.22.4.23"/>
													<manufacturedMaterial>
														<code code="{code/@code}" codeSystem="{code/@codeSystem}">
															<originalText>
																<xsl:value-of select="medtext/@value"/>
															</originalText>
														</code>
													</manufacturedMaterial>
												</manufacturedProduct>
											</consumable>
										</substanceAdministration>
									</entry>
								</xsl:if>
							</xsl:for-each>
						</section>
					</component>
					<!--******************************************************** Problems Section ********************************************************-->
					<component>
						<section nullFlavor="NI">
							<!--[C-CDA R1.1] Problem Section (entries optional)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.5"/>
							<!--[C-CDA R2.1] Problem Section (entries optional) (V3)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.5" extension="2015-08-01"/>
							<!--[C-CDA R1.1] Problem Section (entries required)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.5.1"/>
							<!-- [C-CDA R2.1] Problem Section (entries required) (V3)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.5.1" extension="2015-08-01"/>
							<code code="11450-4" displayName="Problem List" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>Problem List</title>
							<text/>
							<xsl:for-each select="/data/ProblemConcernAct/ProblemObservation">
								<xsl:if test="not(value/@code = '')">
									<entry>
										<act classCode="ACT" moodCode="EVN">
											<templateId root="2.16.840.1.113883.10.20.22.4.3"/>
											<templateId extension="2015-08-01" root="2.16.840.1.113883.10.20.22.4.3"/>
											<id extension="20516347-concern" root="1.2.840.114350.1.13.000.2.7.2.777777"/>
											<code code="CONC" codeSystem="2.16.840.1.113883.5.6" codeSystemName="HL7ActClass" displayName="Concern"/>
											<statusCode code="active"/>
											<effectiveTime>
												<low value="{/data/effectiveTime/effectiveTimes/@value}"/>
											</effectiveTime>
											<entryRelationship inversionInd="false" typeCode="SUBJ">
												<observation classCode="OBS" moodCode="EVN">
													<templateId root="2.16.840.1.113883.10.20.22.4.4"/>
													<templateId extension="2015-08-01" root="2.16.840.1.113883.10.20.22.4.4"/>
													<id extension="20516347" root="1.2.840.114350.1.13.000.2.7.2.777777"/>
													<code code="64572001" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
														<translation code="75323-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
													</code>
													<statusCode code="completed"/>
													<effectiveTime>
														<low value="{/data/effectiveTime/effectiveTimes/@value}"/>
													</effectiveTime>
													<value xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" code="{value/@code}" codeSystem="{value/@codeSystem}" displayName="{value/@displayName}" xsi:type="CD">
														<originalText>
															<xsl:value-of select="value/@displayName"/>
														</originalText>
														<translation code="{translation/@code}" codeSystem="{translation/@codeSystem}" displayName="{translation/@displayName}"/>
													</value>
												</observation>
											</entryRelationship>
										</act>
									</entry>
								</xsl:if>
							</xsl:for-each>
						</section>
					</component>
					<!--******************************************************** Reason for visit Section ********************************************************-->
					<component>
						<section nullFlavor="NI">
							<templateId root="2.16.840.1.113883.10.20.22.2.12"/>
							<code code="29299-5" displayName="Reason for visit" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>Reason for visit</title>
							<text>
								<paragraph/>
							</text>
						</section>
					</component>
					<!--******************************************************** Results Section ********************************************************-->
					<component>
						<section>
							<!--[C-CDA R1.1] Results Section (entries optional)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.3"/>
							<!--[C-CDA R2.1] Results Section (entries optional) (V3)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.3" extension="2015-08-01"/>
							<!--[C-CDA R1.1] Results Section (entries required)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.3.1"/>
							<!-- [C-CDA R2.1] Results Section (entries required) (V3)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.3.1" extension="2015-08-01"/>
							<code code="30954-2" displayName="Relevant diagnostic tests and/or laboratory data" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>Results</title>
							<text>
						
					</text>
							<xsl:for-each select="/data/Results/ResultOrganizer">
								<xsl:if test="not(code/@code = '')">
									<entry typeCode="DRIV">
										<!---->
										<organizer moodCode="EVN" classCode="BATTERY">
											<!--[C-CDA R1.1] Result Organizer -->
											<templateId root="2.16.840.1.113883.10.20.22.4.1"/>
											<!--[C-CDA R2.1] Result Organizer (V3)-->
											<templateId root="2.16.840.1.113883.10.20.22.4.1" extension="2015-08-01"/>
											<id root="f58d10ce-f31f-4d44-83f6-fd96ffdceb3f"/>
											<code code="{code/@code}" displayName="{code/@displayName}" codeSystem="{code/@codeSystem}"/>
											<statusCode code="completed"/>
											<effectiveTime>
												<low value="{/data/effectiveTime/effectiveTimeResult/@value}"/>
												<high value="{/data/effectiveTime/effectiveTimeResult/@value}"/>
											</effectiveTime>
											<xsl:if test="not(specimen/@code = '')">
												<component>
													<procedure classCode="PROC" moodCode="EVN">
														<code code="17636008" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="Specimen collection (procedure)"/>
														<effectiveTime value="{/data/effectiveTime/effectiveTimeResult/@value}"/>
														<participant typeCode="PRD">
															<participantRole classCode="SPEC">
																<id extension="830830830830" root="111111111111111"/>
																<playingEntity>
																	<code code="{specimen/@code}" codeSystem="{specimen/@codeSystem}" displayName="{specimen/@displayName}"/>
																</playingEntity>
															</participantRole>
														</participant>
													</procedure>
												</component>
											</xsl:if>
											<component>
												<observation moodCode="EVN" classCode="OBS">
													<!--[C-CDA R1.1] Result Observation -->
													<templateId root="2.16.840.1.113883.10.20.22.4.2"/>
													<!--[C-CDA R2.1] Result Observation (V3)-->
													<templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2015-08-01"/>
													<templateId root="2.16.840.1.113883.10.20.15.2.3.2" extension="2016-12-01"/>
													<id root="a7b2f0fb-d100-4f63-a7e0-12c8ebf49aab"/>
													<code code="{code/@code}" displayName="{code/@displayName}" codeSystem="{code/@codeSystem}"/>
													<statusCode code="completed"/>
													<effectiveTime value="{/data/effectiveTime/effectiveTimeResult/@value}"/>
													<xsl:choose>
														<xsl:when test="value/@code = ''">
															<value xsi:type="PQ" unit="{value/@unit}" value="{value/@value}"/>
														</xsl:when>
														<xsl:otherwise>
															<value xsi:type="CD" code="{value/@code}" displayName="{value/@displayName}" codeSystem="{value/@codeSystem}"/>
														</xsl:otherwise>
													</xsl:choose>
													<interpretationCode code="{interpretationCode/@code}" displayName="{interpretationCode/@displayName}" codeSystem="{interpretationCode/@codeSystem}"/>
												</observation>
											</component>
										</organizer>
									</entry>
								</xsl:if>
							</xsl:for-each>
						</section>
					</component>
					<!--******************************************************** Plan of Care/Treatment Section ********************************************************-->
					<component>
						<section>
							<!--[C-CDA R1.1] Plan of Care Section new-->
							<templateId root="2.16.840.1.113883.10.20.22.2.22.1"/>
							<templateId root="2.16.840.1.113883.10.20.22.2.22.1" extension="2014-06-09"/>
							<code code="18776-5" displayName="Plan of Treatment" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>Plan of Treatment</title>
							<text>
						
					</text>
							<xsl:for-each select="/data/PlanOfTreatment/PlannedObservation">
								<xsl:if test="not(code/@code = '')">
									<entry>
										<!--This is a request for a test to be performed (a lab test order)-->
										<observation classCode="OBS" moodCode="INT">
											<!--[C-CDA R1.1] Plan of Care Activity Observation-->
											<templateId root="2.16.840.1.113883.10.20.22.4.44"/>
											<!--[C-CDA R2.0] Planned Observation (V2)-->
											<templateId root="2.16.840.1.113883.10.20.22.4.44" extension="2014-06-09"/>
											<id root="68949b41-860b-41a4-b145-49c713e207e2"/>
											<code code="{code/@code}" displayName="{code/@displayName}" codeSystem="{code/@codeSystem}"/>
											<statusCode code="active"/>
											<effectiveTime value="{/data/effectiveTime/effectiveTimes/@value}"/>
										</observation>
									</entry>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/data/PlanOfTreatment/PlannedProcedure">
								<xsl:if test="not(code/@code = '')">
									<entry>
										<!--This is a request for a procedure to be performed (a procedure order)-->
										<procedure moodCode="INT" classCode="PROC">
											<!--[C-CDA R1.1] Planned Procedure-->
											<templateId root="2.16.840.1.113883.10.20.22.4.41"/>
											<!--[C-CDA R2.0] Planned Procedure (V2)-->
											<templateId root="2.16.840.1.113883.10.20.22.4.41" extension="2014-06-09"/>
											<id root="68949b41-860b-41a4-b145-49c713e207e2"/>
											<code code="{code/@code}" displayName="{code/@displayName}" codeSystem="{code/@codeSystem}"/>
											<statusCode code="active"/>
											<effectiveTime value="{/data/effectiveTime/effectiveTimes/@value}"/>
										</procedure>
									</entry>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="/data/PlanOfTreatment/PlannedMedication">
								<xsl:if test="not(code/@code = '')">
									<entry>
										<!--This is a Planned Medication Activity Medication Activity (V2)-->
										<substanceAdministration classCode="SBADM" moodCode="INT">
											<templateId root="2.16.840.1.113883.10.20.22.4.42"/>
											<templateId extension="2014-06-09" root="2.16.840.1.113883.10.20.22.4.42"/>
											<id root="831293486"/>
											<statusCode code="active"/>
											<effectiveTime value="{/data/PlanOfTreatment/PlannedMedication/effectiveTime/@value}"/>
											<consumable>
												<manufacturedProduct classCode="MANU">
													<templateId root="2.16.840.1.113883.10.20.22.4.23"/>
													<templateId extension="2014-06-09" root="2.16.840.1.113883.10.20.22.4.23"/>
													<manufacturedMaterial>
														<code code="{code/@code}" codeSystem="{code/@codeSystem}" displayName="{/data/PlanOfTreatment/PlannedMedication/code/@displayName}"/>
													</manufacturedMaterial>
												</manufacturedProduct>
											</consumable>
										</substanceAdministration>
									</entry>
								</xsl:if>
							</xsl:for-each>
						</section>
					</component>
					<!--******************************************************** Social History Section ********************************************************-->
					<component>
						<section>
							<!-- [C-CDA 1.1] Social History Section-->
							<templateId root="2.16.840.1.113883.10.20.22.2.17"/>
							<!--[C-CDA 2.1] Social History Section (V3)-->
							<templateId root="2.16.840.1.113883.10.20.22.2.17" extension="2015-08-01"/>
							<code code="29762-2" displayName="Social History" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<title>Social History</title>
							<text>
						
					</text>
							<entry typeCode="DRIV">
								<observation moodCode="EVN" classCode="OBS">
									<!--[C-CDA R2.1 Companion Guide] Birth Sex Observation -->
									<templateId root="2.16.840.1.113883.10.20.22.4.200"/>
									<templateId root="2.16.840.1.113883.10.20.22.4.200" extension="2016-06-01"/>
									<code code="76689-9" displayName="Sex Assigned At Birth" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<statusCode code="completed"/>
									<effectiveTime value="20151225">
										<!--effectiveTime if present should match birthTime-->
									</effectiveTime>
									<value code="F" displayName="Female" codeSystem="2.16.840.1.113883.5.1" codeSystemName="AdministrativeGender" xsi:type="CD"/>
								</observation>
							</entry>
							<entry typeCode="DRIV">
								<!--Occupation-->
								<observation moodCode="EVN" classCode="OBS">
									<!--[C-CDA R1.1] Social History Observation-->
									<templateId root="2.16.840.1.113883.10.20.22.4.38"/>
									<!--[C-CDA R2.1] Social History Observation (V3)-->
									<templateId root="2.16.840.1.113883.10.20.22.4.38" extension="2015-08-01"/>
									<id root="aa1d3dd0-5eff-447e-9e05-19736ee44b98"/>
									<code code="364703007" displayName="Employment detail" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
										<translation code="11295-3" displayName="Current employment - Reported" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									</code>
									<statusCode code="completed"/>
									<effectiveTime/>
									<value code="159606005" displayName="Sales" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" xsi:type="CD"/>
								</observation>
							</entry>
							<xsl:if test="not(/data/pregnancy/effectiveTime/@value = '')">
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<templateId root="2.16.840.1.113883.10.20.15.3.8"/>
									<id extension="Z4735487^66910^77386006" root="1.2.840.114350.1.13.301.2.7.1.1040.6"/>
									<code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
									<statusCode code="completed"/>
									<effectiveTime>
										<low value="{/data/pregnancy/effectiveTime/@value}"/>
									</effectiveTime>
									<value xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" code="77386006" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="Pregnancy" xsi:type="CD"/>
									<entryRelationship typeCode="REFR">
										<observation classCode="OBS" moodCode="EVN">
											<templateId root="2.16.840.1.113883.10.20.15.3.1"/>
											<code code="11778-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Estimated date of delivery"/>
											<statusCode code="completed"/>
											<value xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" value="{/data/pregnancy/EDD/@value}" xsi:type="TS"/>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
							</xsl:if>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
