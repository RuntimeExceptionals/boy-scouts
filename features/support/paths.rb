module NavigationHelpers
  def path_to(page_name)
    case page_name
 
    when /the home\s?page/
      '/'

    when /home\s?/
      root_path

    when /admin/
      '/admin'

    when /dashboard/
      '/admin'

    when /generate run sheets/
      '/run_sheets/generate_runsheets/1'

    when /generate run sheets pdf/
      '/run_sheets/generate_runsheets_pdf/1'

    when /generate group report pdf/
      '/group/1/report/pdf'

    when /generate invoice pdf/
      'subscription/1/generate_invoices_pdf'

    when /generate invoice/
      'subscription/1/generate_invoices'

    when /users/
      '/admin/user'

    when /payments/
      '/admin/payment'

    when /routes/
      '/admin/route'

    when /runs/
      '/admin/run'

    when /subscriptions/
      '/admin/subscription'

    when /groups/
      '/admin/group'

    when /member runs/
      '/admin/members_run'

    when /tasks/
      '/admin/task'

    when /groupList/
      '/group/view_groups'

    when /routeList/
      '/routes/view_routes'

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
