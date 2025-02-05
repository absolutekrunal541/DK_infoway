<?php

namespace App\Repositories\Interface;

interface StockInterface
{
    //find the customer
    public function find($id);

    //find the all customer
    public function findAll();

    //get data for datatble 
    public function getAllList($request);

    //save customer data into database
    public function store($data);

    //remove customer from the database
    public function destroy($id);
}
