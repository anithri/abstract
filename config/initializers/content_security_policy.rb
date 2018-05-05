Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data
  policy.object_src  :none
  policy.script_src  :self, :https
  policy.style_src   :self, :https, :unsafe_inline

  if Rails.env.development?
    policy.script_src :self, :https, :unsafe_eval
    policy.connect_src :self, :https, 'http://localhost:3035', 'ws://localhost:3035'
  end

  # Specify URI for violation reports
  # policy.report_uri "/csp-violation-report-endpoint"
end
