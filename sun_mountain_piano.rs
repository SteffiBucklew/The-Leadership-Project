// The Leadership Project

// The project is to create a comprehensive digital platform for exploring different aspects of leadership.

// Imports
use std::io;
use std::collections::HashMap;

// Main function
fn main() {
    // Variables for storing user input
    let mut user_name = String::new();
    let mut user_role = String::new();

    // Gather user information
    println!("Please enter your name: ");
    io::stdin().read_line(&mut user_name).expect("Failed to read line");
    println!("Please enter your role: ");
    io::stdin().read_line(&mut user_role).expect("Failed to read line");

    // Create a HashMap to store user information
    let mut user_info = HashMap::new();
    user_info.insert(user_name, user_role);

    // Variables for storing project information
    let project_name = String::from("The Leadership Project");
    let project_desc = String::from("This project aims to create a comprehensive digital platform for exploring different aspects of leadership.");
    let project_tasks = vec!["Researching different aspects of leadership", "Creating a digital platform for exploring the different aspects", "Designing the user interface and navigating the platform"];

    // Create a HashMap to store project information
    let mut project_info = HashMap::new();
    project_info.insert(project_name, project_desc);
    project_info.insert(project_tasks.len(), project_tasks);

    // Print user and project information
    println!("Name: {}\nRole: {}", user_name, user_role);
    println!("Project Name: {}\nProject Description: {}\nProject Tasks:\n", project_name, project_desc);

    // Print the list of project tasks
    for (index, task) in project_tasks.iter().enumerate() {
        println!("\t{}. {}", index+1, task);
    }

    // Variables for storing feedback information
    let mut user_feedback = String::new();
    let mut user_rating = String::new();

    // Gather user feedback
    println!("Please provide feedback about the project: ");
    io::stdin().read_line(&mut user_feedback).expect("Failed to read line");
    println!("Please rate the project from 1-10: ");
    io::stdin().read_line(&mut user_rating).expect("Failed to read line");

    // Create a HashMap to store feedback information
    let mut feedback_info = HashMap::new();
    feedback_info.insert(user_name, (user_feedback, user_rating));

    // Print the user feedback
    println!("Your feedback:\n{} -> {}", user_feedback, user_rating);
}