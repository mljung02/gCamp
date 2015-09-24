require 'rails_helper'

describe 'Tasks' do
  it 'User can CRUD tasks' do
  # User can Create a task

    visit '/'
    click_link("Tasks")
    click_on('New Task')
    fill_in('Description', with: "My first task")
    click_on('Create Task')
    expect(page).to have_content("Task successfully created")

  # User can Edit a task

    click_on "Edit"
    fill_in('Description', with: 'My first EDITED task')
    click_on('Update Task')
    expect(page).to have_content('Task successfully updated!')

  # User can delete a task
    click_link('Home')
    expect(page).to have_content('My first EDITED task')
    click_on('Delete')
    expect(page).to have_no_content('My first EDITED task')
  end

  xit 'User can complete a task' do
    task = Task.create(description: "Complete Me!")
    visit task_path(task)
    checkbox.should_not be_checked
    check("task_completed")
    checkbox.should be_checked
    expect(page).to have_content("Task successfully completed")
    #
    # page.should have_content('Description')
  end
end
