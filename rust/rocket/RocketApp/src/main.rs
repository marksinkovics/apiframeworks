#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;

#[get("/hello")]
fn index() -> &'static str {
    "Hello, world!"
}

fn main() {
    let rocket = rocket::ignite()
        .mount("/", routes![index]);
    rocket.launch();
}