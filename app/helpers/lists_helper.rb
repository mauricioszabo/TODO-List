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

  def remove_task_link(form_builder)
    # If the task is a new record, we can just remove the div from the dom
    link_to_function("remove", "$(this).up('.task').remove();");
  end
end
