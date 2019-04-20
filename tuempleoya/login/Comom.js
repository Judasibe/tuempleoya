var mensajeCorreoInvalido = 'Debe colocar un correo valido';
var mensajeHoraFinalMenor = 'La fecha final no debe ser menor a la inicial';
var mensajeCargando = 'Cargando...';
var mensajeCancelado = 'Cancelado';
var etiqueta_ConfirmarEliminar = 'Confirme Eliminación';
var mensajeExitoso = 'Proceso finalizado Correctamente';
var mensajeLlamarAtencion = 'No interrumpa el correcto funcionamiento del programa';

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

function ValidarFechas(inicial, final) {
    var horainicial = inicial.substring(0, 2);
    var horafinal = final.substring(0, 2);
    var minutosinicial = inicial.substring(3);
    var minutosfinal = final.substring(3);

    if (horainicial > horafinal) {
        LlamarAlert(mensajeHoraFinalMenor);
        return false;
    }
    else if (horainicial == horafinal && minutosinicial > minutosfinal) {
        LlamarAlert(mensajeHoraFinalMenor);
        return false;
    }
    return true;
}

function cerrarModal(modal) {
    $('#' + modal).modal().hide();
    $('.modal-backdrop').remove();
    CerrarNotifyCargando();
    LlamarAlert(mensajeExitoso, 'success');
}

function MostrarModal(modal) {
    CerrarNotifyCargando();
    $('#' + modal).modal({
          backdrop: true
        , keyboard: false
    }).show();
}

function CerrarNotifyCargando()
{
    alertify.alert().close(); 
}

function MostrarModalCargando()
{
    var htmlProgressBar = '<div class="progress">';
    htmlProgressBar += '<div class="progress-bar progress-bar-striped progress-bar-success active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>';
    htmlProgressBar += '</div>';
    htmlProgressBar += '<h4 class="text-center">' + mensajeCargando + '</h4>';
    alertify.alert(htmlProgressBar).set('basic', true).set('closable', false);
    return true;
}

function PreguntarSiSeElimina(mensajeEliminar, nombre, TextParaGuardarId, id, BotonDelPostBack)
{
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

function VerImagen(imagen)
{
    if (imagen === undefined)
    {
        LlamarAlert(mensajeLlamarAtencion);
    } else {
        var img = $(imagen);
        var img2 = $('#imagenModal')[0];
        img2.src = img[0].src;
        MostrarModal('VerImagenModal');
    }
}