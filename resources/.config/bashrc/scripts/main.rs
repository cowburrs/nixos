use rand::Rng;
use std::{thread, time};

fn main() {
    let my_table = vec![
        "distusting pig fedora user",
        "kys",
        "please neck",
        "actual subhuman",
        "waste of air",
        "go 15 irl",
        "go walk into the ocean",
        "dog",
    ];
    let mut rng = rand::thread_rng();
    println!("{}", my_table[rng.gen_range(0..my_table.len())]);
    thread::sleep(time::Duration::from_secs(1));
    println!("{}", my_table[rng.gen_range(0..my_table.len())]);
}
