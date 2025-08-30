    #[test_only]
module workshop_project::todo_list_test{
    const ENotFound: u64 = 1000;


    use workshop_project::todo_list::{TodoList, Self};
    #[test]
    fun tes_todo_list(){
        let ctx = &mut tx_context::dummy();
        let mut list = todo_list::new(ctx);

        todo_list::add(&mut list, b"wash my clothes!".to_string());

        assert!(todo_list::get_item(&list, 0)  == b"wash my car!".to_string(), ENotFound);
        todo_list::delete(list);


    }
}