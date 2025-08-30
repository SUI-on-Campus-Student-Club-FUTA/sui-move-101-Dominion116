#[test_only]
module workshop_projects::todo_list_test{
    const ENotFound: u64 = 1000;

    use workshop_projects::todo_list::{TodoList, Self};
    use std::string;
    
    #[test_only]
    fun test_create_list(): TodoList{
        let ctx = &mut tx_context::dummy();
        todo_list::new(ctx)
    }
    
    #[test]
    fun test_todo_list(){
        
        let mut list = test_create_list();
        
        todo_list::add(&mut list, string::utf8(b"wash my clothes!"));
        assert!(todo_list::get_item(&list, 0) == string::utf8(b"wash my clothes!"), ENotFound);

        todo_list::add(&mut list, string::utf8(b"buy groceries"));
        todo_list::add(&mut list, string::utf8(b"read move-book docs"));

        assert!(todo_list::length(&list) == 3, ENotFound);
        
        todo_list::delete(list);
    }
}