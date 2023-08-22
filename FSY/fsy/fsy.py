from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)

from werkzeug.exceptions import abort

from flask_qrcode import QRcode
from segno import helpers

from fsy.auth import login_required
from fsy.db import get_db

import unidecode

bp = Blueprint('fsy', __name__)


@bp.route('/')
def index():
    return render_template('fsy/index.html')


@bp.route('/lists/<string:type>', methods=('GET', 'POST'))
def lists(type):
    lists = None
    db = get_db()

    if request.method == 'POST':
        select = request.form['select']

        search = request.form['search']
        search = unidecode.unidecode(search)
        search = search.upper()

        if type == 'participantes':
            if search:
                query = "SELECT * FROM participant WHERE {sel} like '%{sea}%'".format(sel=select, sea=search)
                print(query)
                lists = db.execute(
                 query
                ).fetchall()
            else:
                lists = db.execute(
                 'SELECT * FROM participant'
                ).fetchall()

            removeList = []

            for participant in lists:
                try:
                    if request.form['checkin']:
                        if participant['checked_in'] != request.form['checkin']:
                            removeList.append(participant)
                except:
                    pass

                try:
                    if request.form['kit']:
                        if participant['kit'] != request.form['kit']:
                            removeList.append(participant)
                except:
                    pass

                try:
                    if request.form['shirt']:
                        if participant['shirt'] != request.form['shirt']:
                            removeList.append(participant)
                except:
                    pass

                try:
                    if request.form['show']:
                        if participant['varieties_show'] != request.form['show']:
                            removeList.append(participant)
                except:
                    pass

                try:
                    if request.form['music']:
                        if participant['musical_program'] != request.form['music']:
                            removeList.append(participant)
                except:
                    pass

                try:
                    if request.form['nametag']:
                        if participant['name_tag'] != request.form['nametag']:
                            removeList.append(participant)
                except:
                    pass

                try:
                    if request.form['company']:
                        if participant['company_id'] and request.form['company'] == 'NAO':
                            removeList.append(participant)

                        if not participant['company_id'] and request.form['company'] == 'SIM':
                            removeList.append(participant)
                except:
                    pass



            print(removeList)
            for participant in removeList:
                try:
                    lists.remove(participant)
                except:
                    pass

        elif type == 'lideres':
            if search:
                query = "SELECT * FROM lider WHERE {sel} like '%{sea}%'".format(sel=select, sea=search)
                lists = db.execute(
                 query
                ).fetchall()
            else:
                lists = db.execute(
                 'SELECT * FROM lider'
                ).fetchall()
                

    else:
        if type == 'participantes':
            lists = db.execute(
                 'SELECT * FROM participant'
                ).fetchall()
        elif type == 'lideres':
            lists = db.execute(
                 'SELECT * FROM lider'
                ).fetchall()

    return render_template('fsy/lists.html', lists=lists, profile_type=type, length=len(lists))


@bp.route('/register', methods=('GET', 'POST'))
def register():
    if request.method == 'POST':
        person_type = request.form['inlineRadioOptions']

        if person_type == '1':
            return redirect(url_for('fsy.register_profile', type='participante'))
        else:
            return redirect(url_for('fsy.register_profile', type='lider'))

    return render_template('fsy/register.html', profile_type=None)


@bp.route('/register/<string:type>', methods=('GET', 'POST'))
def register_profile(type):
    hotel = None
    company = None
    query = None
    db = get_db()

    if request.method == 'POST':
        name = unidecode.unidecode(request.form['name']).upper()
        age = request.form['age']
        gender = request.form['genderRadio']
        hotel = request.form['hotel']
        room = request.form['room']
        company = request.form['company']

        if type == 'participante':
            stake = unidecode.unidecode(request.form['stake']).upper()
            ward = unidecode.unidecode(request.form['ward']).upper()
            checkin = request.form['checkin']
            kit = request.form['kit']
            shirt = request.form['shirt']
            nametag = request.form['nametag']
            show = request.form['show']
            music = request.form['music']

        if type == 'participante':
            query = 'INSERT INTO participant (name, age, gender, room, hotel, stake, ward, checked_in, kit, name_tag, shirt, musical_program, varieties_show'

            if company == None:
                query = query + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
                db.execute(query, (name, age, gender, room, hotel, stake, ward, checkin, kit, shirt, nametag, show, music))
            else:
                query = query + ", company_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
                db.execute(query, (name, age, gender, room, hotel, stake, ward, checkin, kit, shirt, nametag, show, music, company))
            
        else:
            telephone = request.form['telephone']
            responsability = request.form['responsability']
            username = request.form['username']
            password = request.form['password']

            query = 'INSERT INTO lider (name, gender, room, hotel, telephone, reponsability_level, username, password'

            if company == None:
                query = query + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?);"
                db.execute(query, (name, gender, room, hotel, telephone, responsability, username, password))
            else:
                query = query + ", company_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);"
                db.execute(query, (name, gender, room, hotel, telephone, responsability, username, password, company))

        db.commit()

        return redirect(url_for('fsy.index'))

    else:
        company = db.execute('SELECT id FROM company order by id').fetchall()

    return render_template('fsy/register.html', profile_type=type, hotel_list=hotel, companies=company)


@bp.route('/profile/<string:type>/<string:id>', methods=('GET', 'POST'))
def profile(type, id):
    profile = None
    vcard = None
    db = get_db()

    if type == 'participante':
        profile = db.execute(
         'SELECT * FROM participant WHERE id = ?', ([id])
        ).fetchone()

        if profile:
            lider = db.execute(
                 'SELECT * FROM lider WHERE company_id = ?', ([profile['company_id']])
                ).fetchone()

            if lider:
                try:
                    vcard = helpers.make_vcard_data(name=f"Consultor - {lider['name']}; FSY", 
                        displayname=f"FSY Consultor-{lider['name'].split()[0]}", 
                        phone=f"{lider['telephone']}",
                        memo=f"{profile['hotel']} - {profile['room']}")
                except:
                    pass
                

    elif type == 'lider':
        profile = db.execute(
         'SELECT * FROM lider WHERE id = ?', (id)
        ).fetchone()

    if profile == None:
        return redirect(url_for('fsy.lists'))

    return render_template('fsy/profile.html', profile_type=type, profile=profile, code=vcard)
