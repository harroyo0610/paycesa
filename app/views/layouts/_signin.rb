<% provide(:title, "Signin")%>

<h1>Signin</h1>

<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<%= form_for(:sessions, url: login_path) do |f| %>

			<%= f.label "Email:" %>
			<%= f.email_field "email", class: "form-control" %>
			<%= f.label "Password:" %>
			<%= f.password_field "password", class: "form-control" %>
			<%= f.label "Remember me", class: 'checkbox inline'%>
			<%= f.check_box "remember_me"%><span>Remember me</span>
			<%= f.submit "Signin", class: "btn btn-primary"%>
		<% end %>
		<p>New user? <%= link_to "Sign up now!", signup_path %></p>
	</div>
</div>