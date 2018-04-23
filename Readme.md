# How to populate a cascading ASPxComboBox on the client side 


<p>ASPxComboBox is a server control and it is usually bound with a datasource on the server side. Meanwhile the control allows initialization on the client side. It is especially useful if each round trip to server is resource-intensive.</p><p>The main idea of the demonstrated approach is to load all possible data on first page load. It increases first page load time, but allows you to avoid further round trips to select data for a cascaded ASPxComboBox.</p>

<br/>


