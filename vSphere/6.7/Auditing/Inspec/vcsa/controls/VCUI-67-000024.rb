control "VCUI-67-000024" do
  title "vSphere UI must not enable support for TRACE requests."
  desc  "\"Trace\" is a technique for a user to request internal information
about Tomcat. This is useful during product development, but should not be
enabled in production.  Allowing a attacker to conduct a Trace operation
against the Security Token Service will expose information that would be useful
to perform a more targeted attack. vSphere UI provides the allowTrace parameter
as means to disable responding to Trace requests."
  impact CAT II
  tag severity: "CAT II"
  tag gtitle: nil
  tag gid: nil
  tag rid: "VCUI-67-000024"
  tag stig_id: "VCUI-67-000024"
  tag fix_id: nil
  tag cci: nil
  tag nist: nil
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: nil
  tag check: "At the command prompt, execute the following command:

# grep allowTrace /usr/lib/vmware-vsphere-ui/server/conf/server.xml

If allowTrace is set to \"true\", this is a finding. If no line is returned
this is NOT a finding."
  tag fix: "Navigate to and open
/usr/lib/vmware-vsphere-ui/server/conf/server.xml

Navigate to and locate 'allowTrace=\"true\"'

Remove the 'allowTrace=\"true\"' setting."
end
