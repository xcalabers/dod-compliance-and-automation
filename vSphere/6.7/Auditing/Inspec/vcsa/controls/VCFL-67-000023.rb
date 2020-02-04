control "VCFL-67-000023" do
  title "vSphere Client must not show directory listings."
  desc  "Enumeration techniques, such as URL parameter manipulation, rely upon
being able to obtain information about the web server's directory structure by
locating directories without default pages. In the scenario, the web server
will display to the user a listing of the files in the directory being
accessed. Ensuring that directory listing is disabled is one approach to
mitigating the vulnerability."
  impact 0.5
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000266-WSR-000142"
  tag gid: nil
  tag rid: "VCFL-67-000023"
  tag stig_id: "VCFL-67-000023"
  tag fix_id: nil
  tag cci: "CCI-001312"
  tag nist: ["SI-11 a", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "SI-11 a"
  tag check: "At the command prompt, execute the following command:

# xmllint --format
/usr/lib/vmware-vsphere-client/server/configuration/conf/web.xml | sed
's/xmlns=\".*\"//g' | xmllint --xpath
'//param-name[text()=\"listings\"]/parent::init-param' -

Expected result:

<init-param>
      <param-name>listings</param-name>
      <param-value>false</param-value>
    </init-param>

If the output of the command does not match the expected result, this is a
finding."
  tag fix: "Navigate to and open
/usr/lib/vmware-vsphere-client/server/configuration/conf/web.xml

Set the <param-value> to \"false\" in all <param-name>listing</param-name>
nodes.

Note: The setting should look like the below:

<init-param>
      <param-name>listings</param-name>
      <param-value>false</param-value>
</init-param>"

  describe xml('/usr/lib/vmware-vsphere-client/server/configuration/conf/web.xml') do
    its('/web-app/servlet/init-param[param-name="listings"]/param-value') { should cmp "false" }
  end

end