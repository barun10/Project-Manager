## Project Management Tool

# Features:

Users can **register with their _mail id_ and create their _password_** or **sign up with their _Outlook_ Account**.

Once logged in, users will be able to **create projects with Project name in a text field** and save it. **Multiple projects can be created** with a ‘plus’ icon to add projects.

After the project will be created it will be listed under a **tab called Project**. Selecting a specific project it will open in a new tab to its respective dashboard.

The project **dashboard will have three different panels** in separate columns format. The different panels are **Current Iteration, Backlog & Icebox**. The panels can be closed with the ‘X’ cross icon. Once closed the panel can be opened from the left side navigation.

Under each of the panels, there will be an option to add the project features with a button named ‘+Add feature’. Clicking on it will expand a form to write the **title in a text field, description in a text area** to brief the feature more. Another **section will be there to add tasks**.

On creating a new feature, the system should create **an auto-generated ticket id** for feature identification.

There should be **Search Bar** whereby **searching** with the **ticket id number** or the **title of the feature** or any **relevant keyword search**, it should **show the results accordingly**.

Add a Text field to add more tasks under one feature which will be there with a **checkbox option in each of the tasks to mark the specific task as done** and add a button beside each of them. Hitting on entering it should get saved as well.

With each of the features, **an attachment** can be added for **image, documents or (JPG/PNG), DOCS, PDF, XLS, etc**.

There should be a **dropdown option to assign the feature to the members** who have an account. The **dropdown will have filters to type and search the name of the members for easy filtration**.

**Task count should be shown** beside the task in brackets [For **Example**: (3/5)] with the total number of added tasks and number of tasks marked as completed.

There will be a **comment box with a text area below each of the features for internal communication**. In the comment box, members can be mentioned by “@” and the name of the member to highlight it.

There will be a **feature status option** with the following functions like **Started, Finished, Delivered**.

On each status change and comments by the users, it should **send an email notification to the respective team members mail id** and also the notification should be shown in the user account dashboard with the count.


# Steps

1. Create **User Authentication** for email and outlook account(using OmniAuth).

2. Create **Project** model which belongs to **User** with attribute _name_.

3. Create **Feature** model which belongs to **Project** with attribute _project\_id_, _title_, _description_, _panel\_name_, _ticket\_id_, _file_, _status_.

4. Create a **Search** feature in **project dashboard**.

5. Create **Task** model which belongs to **Feature** with attribute _feature\_id_, _description_, _status_(checkbox) with scope _count_.

6. Create _has\_many\_and\_belongs\_to_ releationship between **Feature** and **User** model.

7. Create **Comment** model which belongs to **Feature** with attribute _comment_, _user\_id, _feature\_id_.

8. Create **mention using '@'** feature in _comments_

8. Create **mailers** for feature status changes and new comments.

9. Create **notification system** for feature status changes and new comments add.