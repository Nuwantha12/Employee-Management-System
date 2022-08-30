<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="ZigZag.staffmemberpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            //$(document).ready(function () {
            //$('.table').DataTable();
            // });

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$('.table1').DataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mb-5 mt-5">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Employee Management</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/staff.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <p class="font-weight-bold">- To add an employee, please fill the form and press “<span class="text-primary">ADD</span>” </p>
                                <p class="font-weight-bold">- To edit an entry, type the Emp No in the form and press go. After doing relevant changes press “<span class="text-warning">UPDATE</span>” </p>
                                <p class="font-weight-bold">- To delete an entry, type the Emp No in the form and press go. After that press “<span class="text-danger">DELETE</span>” </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Employee No</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="empno" runat="server" class="mr-2" placeholder="Employee No"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Search Employee No</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:Button ID="Button5" class="btn btn-success" runat="server" Text="Go" OnClick="go_Click" style="width:100%;"/>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Employee Name</label>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="empname" runat="server" placeholder="Employee Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dob" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>NIC</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="nic" runat="server" CssClass="form-control" placeholder="NIC"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Phone Number</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="mobilenumber" runat="server" placeholder="Phone Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Address Line 1</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="line1" runat="server" placeholder="Address Line 1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Address Line 2</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="line2" runat="server" placeholder="Address Line 2"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Address Line 3</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="line3" runat="server" placeholder="Address Line 3"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Gender</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="gender" runat="server" placeholder="Gender"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Experiance</label>

                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="experience" runat="server" placeholder="Experiance"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
        <div class="row mb-5 mt-5">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Employee Management List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
                            <asp:GridView ID="GridView1" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="empno" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="empno" HeaderText="empno" ReadOnly="True" SortExpression="empno" />
                                    <asp:BoundField DataField="empname" HeaderText="empname" SortExpression="empname" />
                                    <asp:BoundField DataField="addressline1" HeaderText="addressline1" SortExpression="addressline1" />
                                    <asp:BoundField DataField="addressline2" HeaderText="addressline2" SortExpression="addressline2" />
                                    <asp:BoundField DataField="addressline3" HeaderText="addressline3" SortExpression="addressline3" />
                                    <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                                    <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                                    <asp:BoundField DataField="nic" HeaderText="nic" SortExpression="nic" />
                                    <asp:BoundField DataField="mobilenumber" HeaderText="mobilenumber" SortExpression="mobilenumber" />
                                    <asp:BoundField DataField="experience" HeaderText="experience" SortExpression="experience" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row m-3">
            <asp:Button class="btn btn-primary btn-lg btn-block" ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" />
        </div>
    </div>
</asp:Content>
