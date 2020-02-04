control "VCRP-67-000002" do
  title "rhttpproxy must set a limit on established connections."
  desc  "rhttpproxy client connections must be limited in order to preserve
system resources and to continue servicing connections without interruption.
Without a limit, set the system would be vulnerable to a trivial denial of
service attack where connections are created en masse and vCenter resources are
entirely consumed."
  impact 0.5
  tag severity: "CAT II"
  tag gtitle: "SRG-APP-000001-WSR-000001"
  tag gid: nil
  tag rid: "VCRP-67-000002"
  tag stig_id: "VCRP-67-000002"
  tag fix_id: nil
  tag cci: "CCI-000054"
  tag nist: ["AC-10", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: "AC-10"
  tag check: "At the command prompt, execute the following command:

# sed -n \"/<http>/,/http>/p\" /etc/vmware-rhttpproxy/config.xml|grep -z
--color=always 'maxConnections'

If the value of 'maxConnections' is not set to '2048', is missing or is
commented, this is a finding."
  tag fix: "Navigate to and open /etc/vmware-rhttpproxy/config.xml

Locate the <http> block and configure <maxConnections> as follows:

<maxConnections> 2048 </maxConnections>

Restart the service for changes to take effect.

# vmon-cli --restart rhttpproxy"

  
  describe.one do
  
    describe xml('/etc/vmware-rhttpproxy/config.xml') do
      its(['/config/vmacore/http/maxConnections']) { should cmp ["2048"] }
    end

    describe xml('/etc/vmware-rhttpproxy/config.xml') do
      its(['/config/vmacore/http/maxConnections']) { should cmp [" 2048 "] }
    end
  
  end

end