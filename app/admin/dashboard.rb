ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
      #div class: "blank_slate_container", id: "dashboard_default_message" do
        #span class: "blank_slate" do
          #span I18n.t("active_admin.dashboard_welcome.welcome")
          #small I18n.t("active_admin.dashboard_welcome.call_to_action")
        #end
      #end

    # Admin Users
    def approve_org(org)
      org.approved = true
    end

    #!!! Needs Testing !!!
    @organization = User.where(approved: false)
    columns do
      column do
        panel 'Unapproved Organizations' do
         @organization.each do |org|
            # How organization shows up
            li link_to "View #{org.name} (#{org.email})", adminorg_path(org.id)
          end
        end
      end
    end # content
  end
end
