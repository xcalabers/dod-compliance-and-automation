control "VCST-67-000015" do
  title "The Security Token Service must be configured with memory leak
protection."
  desc  "The Java Runtime environment can cause a memory leak or lock files
under certain conditions. Without memory leak protection, the Security Token
Service can continue to consume system resources which will lead to
OutOfMemoryErrors when re-loading web applications.

    Memory leaks occur when JRE code uses the context class loader to load a
singleton as this will cause a memory leak if a web application class loader
happens to be the context class loader at the time. The
JreMemoryLeakPreventionListener class is designed to initialise these
singletons when Tomcat's common class loader is the context class loader.
Proper use of JRE memory leak protection will ensure that the hosted
application does not consume system resources and cause an unstable environment."
  impact 0.5
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000141-WSR-000086"
  tag gid: nil
  tag rid: "VCST-67-000015"
  tag stig_id: "VCST-67-000015"
  tag fix_id: nil
  tag cci: "CCI-000381"
  tag nist: ["CM-7 a", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "CM-7 a"
  tag check: "At the command prompt, execute the following command:

# grep JreMemoryLeakPreventionListener
/usr/lib/vmware-sso/vmware-sts/conf/server.xml

Expected result:

<Listener
className=\"org.apache.catalina.core.JreMemoryLeakPreventionListener\"/>

If the output of the command does not match the expected result, this is a
finding.

"
  tag fix: "Navigate to and open /usr/lib/vmware-sso/vmware-sts/conf/server.xml

Navigate to the <Server> node.

Add '<Listener
className=\"org.apache.catalina.core.JreMemoryLeakPreventionListener\"/>' to
the <Server> node."

  describe xml('/usr/lib/vmware-sso/vmware-sts/conf/server.xml') do
    its('Server/Listener/attribute::className') { should include 'org.apache.catalina.core.JreMemoryLeakPreventionListener' }
  end

end