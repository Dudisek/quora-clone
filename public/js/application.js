
$(document).ready(function(){
	// SCROLL MENU
     $('[data-toggle="tooltip"]').tooltip()

    // TIME IN POSTS 
     $('#myTabs a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
	})

    // NOT IN USE YET, SORT IT by popularity
	$('#myTabs a[href="#profile"]').tab('show') // Select tab by name
	$('#myTabs a:first').tab('show') // Select first tab
	$('#myTabs a:last').tab('show') // Select last tab
	$('#myTabs li:eq(2) a').tab('show') // Select third tab (0-indexed)


	//  LOGIN POP UP WINDOW
	$('#loginButton').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('Log In ')
	  modal.find('.modal-body input').val()
	})

	//  REGISTRATION POP UP WINDOW
	$('#RegistrationButton').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('Create a new Account ')
	  modal.find('.modal-body input').val()
	})	

	//  CREATE QUESITON POP UP WINDOW
	$('#AskQuestionButton').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('Ask a Question')
	  modal.find('.modal-body input').val()
	})	

	//  EDIT USER POP UP WINDOW
	$('#EditProfileButton').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('Edit Your Profile')
	  modal.find('.modal-body input').val()
	})	

});



