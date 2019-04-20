var mensajeCargando = 'Cargando';

function LlamarAlert(mensaje, tipo) {
    if (tipo == '') {
        tipo = 'warn';
    }
    CerrarNotifyCargando();
    $.notify(mensaje, tipo);
}

function caracteresCorreoValido(Idemail) {
    var email = $(Idemail).val();
    var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);

    if (caract.test(email) == false) {
        LlamarAlert(mensajeCorreoInvalido);
        return false;
    }
    return true;
}

function CerrarNotifyCargando() {
    alertify.alert().close();
}

function MostrarModalCargando() {
    var htmlProgressBar = '<div class="progress">';
    htmlProgressBar += '<div class="progress-bar progress-bar-striped progress-bar-success active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>';
    htmlProgressBar += '</div>';
    htmlProgressBar += '<h4 class="text-center">' + mensajeCargando + '</h4>';
    alertify.alert(htmlProgressBar).set('basic', true).set('closable', false);
    return true;
}

function PreguntarSiSeElimina(mensajeEliminar, nombre, TextParaGuardarId, id, BotonDelPostBack) {
    CerrarNotifyCargando();
    alertify.confirm(etiqueta_ConfirmarEliminar, mensajeEliminar.replace('{0}', nombre),
        function () {
            MostrarModalCargando();
            $(TextParaGuardarId).val('');
            $(TextParaGuardarId).val(id);
            __doPostBack(BotonDelPostBack, '');
        }
        , function () {
            alertify.error(mensajeCancelado)
        }
    );
}

function MostrarModal(modal) {
    CerrarNotifyCargando();
    $('#' + modal).modal({
        backdrop: true
        , keyboard: false
    }).show();
}

function VerImagen(imagen, modal, idimg) {
    if (imagen === undefined) {
        LlamarAlert(mensajeLlamarAtencion);
    } else {
        var img = $(imagen);
        var img2 = $(idimg)[0];
        img2.src = img[0].src;
        MostrarModal(modal);
    }
}
