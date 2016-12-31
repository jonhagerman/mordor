extern crate regex;



use regex::Regex;
use std::env;

fn usage() {
        println!("Usage: is_palindrome \"Test String\" ");
        println!("Usage: returns true or false")

}

fn is_palindrome(line: String) -> bool {
    let re = Regex::new(r"[\W_]").unwrap();

    let line_reg = re.replace_all(&line, "");
    let line_lower = line_reg.to_string().to_lowercase();
    let line_rev = line_lower.chars().rev().collect::<String>();

    return line_lower == line_rev;
}

fn main() 
{
    let args: Vec<String> = env::args().collect();

    match args.len() {
        2 => {
            let arg = args[1].clone();
            match &*arg {
                "?" | "-?" | "-h" | "-H" | "/?" | "/h" | "/H" | "--help" => {
                    usage();
                }
                _ => {
                    println!("{}", is_palindrome(arg));
                }
            }
        }

        _ => {
            usage();
        }
    }
}


