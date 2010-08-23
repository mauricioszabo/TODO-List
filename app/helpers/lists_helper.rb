module ListsHelper
  def name_to(attr)
    "list[tasks_attributes][][#{attr}]"
  end

  def add_task_link(form_builder)
    link_to_function 'New task' do |page|
      form_builder.fields_for :tasks, Task.new do |f|
        page.insert_html :bottom, :tasks, :partial => 'task', :locals => { :f => f }
      end
    end
  end

  def remove_task_link
    # If the task is a new record, we can just remove the div from the dom
    link_to_function("Remove task", "$(this).up('.task').remove();");
  end

  def watch_link
    return if @list.user == current_user
    link_params = { :url => watch_list_path(@list), :update => 'watch' }
    if current_user.watches.collect(&:list_id).include?(@list.id)
      "<div id='watch'>You're watching this list #{link_to_remote('Unwatch', link_params)}</div>"
    else
      "<div id='watch'>#{link_to_remote('Watch', link_params)}</div>"
    end
  end
end
