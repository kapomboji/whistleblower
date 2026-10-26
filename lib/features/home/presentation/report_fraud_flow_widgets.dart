import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/app_theme.dart';

class FraudTopBar extends StatelessWidget {
  const FraudTopBar({required this.title, super.key});

  final String title;

  static const Map<String, String> _headerIconMap = {
    'Report Fraud / Theft': 'assets/FraudInverted.png',
    'Report Bribery / Corruption': 'assets/Bribery.png',
    'Report Conflicts of Interest': 'assets/Conflict.png',
    'Report Harassment / Discrimination': 'assets/Harrassment.png',
    'Report Procurement Irregularities': 'assets/Procurement.png',
    'Report Abuse of Authority': 'assets/AuthorityAbuse.png',
    'Report Financial Misreporting': 'assets/Financial.png',
    'Report Breaches of Company Policy': 'assets/Ploicyb.png',
    'Report Serious Health, Safety and Environmental Violations':
        'assets/health.png',
    'Report Other Concerns': 'assets/others.png',
  };

  String _iconPathForTitle(String reportTitle) {
    return _headerIconMap[reportTitle] ?? 'assets/FraudInverted.png';
  }

  @override
  Widget build(BuildContext context) {
    final iconPath = _iconPathForTitle(title);

    return Container(
      width: double.infinity,
      height: 99,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(
                  width: 48,
                  height: 48,
                ),
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back, color: AppColors.white),
              ),
              Image.asset(
                iconPath,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
                color: AppColors.white,
                colorBlendMode: BlendMode.srcIn,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 1.2),
                    ),
                    child: const Icon(
                      Icons.report_problem,
                      size: 16,
                      color: AppColors.white,
                    ),
                  );
                },
              ),
            ],
          ),
          Positioned(
            left: 64,
            right: 64,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.darkBlue,
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ],
    );
  }
}

class ReportField extends StatefulWidget {
  const ReportField({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.prefixWidget,
    this.prefixSvgAssetPath,
    this.maxLines = 1,
    this.keyboardType,
    this.requiredField = true,
    this.label,
    this.heroTag,
    this.readOnly = false,
    this.onTap,
    this.animationDelay = 0,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final String? prefixSvgAssetPath;
  final int maxLines;
  final TextInputType? keyboardType;
  final bool requiredField;
  final String? label;
  final String? heroTag;
  final bool readOnly;
  final VoidCallback? onTap;
  final int animationDelay;

  @override
  State<ReportField> createState() => _ReportFieldState();
}

class _ReportFieldState extends State<ReportField>
    with TickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _delayController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _delayController = AnimationController(
      duration: Duration(milliseconds: 600 + (widget.animationDelay * 100)),
      vsync: this,
    );
    _delayController.forward();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _delayController.dispose();
    super.dispose();
  }

  Widget? _buildPrefixWidget() {
    if (widget.prefixWidget != null) {
      return widget.prefixWidget;
    }

    if (widget.prefixSvgAssetPath != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 6, right: 4),
        child: SvgPicture.asset(
          widget.prefixSvgAssetPath!,
          width: 22,
          height: 22,
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(
            Color(0xFF5C5C5C),
            BlendMode.srcIn,
          ),
        ),
      );
    }

    if (widget.prefixIcon != null) {
      return Icon(widget.prefixIcon, color: const Color(0xFF5C5C5C));
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final field = TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        hintText: widget.hintText,
        prefixIcon: _buildPrefixWidget(),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 42,
          minHeight: 44,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.background, width: 2.0),
        ),
      ),
      validator: (value) {
        if (widget.requiredField && (value == null || value.trim().isEmpty)) {
          return 'Required field';
        }
        return null;
      },
    );

    final animatedField = AnimatedSize(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: field,
    );

    final fieldChild = widget.heroTag != null
        ? Hero(
            tag: widget.heroTag!,
            createRectTween: (begin, end) =>
                MaterialRectCenterArcTween(begin: begin, end: end),
            flightShuttleBuilder:
                (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                ) {
                  return Material(
                    color: Colors.transparent,
                    child: toHeroContext.widget,
                  );
                },
            child: Material(
              type: MaterialType.transparency,
              child: animatedField,
            ),
          )
        : animatedField;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              color: AppColors.darkBlue,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
        ],
        FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _delayController,
              curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
            ),
          ),
          child: fieldChild,
        ),
      ],
    );
  }
}

class AttachmentAction extends StatelessWidget {
  const AttachmentAction({
    this.icon,
    this.assetPath,
    required this.label,
    required this.onTap,
    this.isRecording = false,
    super.key,
  });

  final IconData? icon;
  final String? assetPath;
  final String label;
  final VoidCallback onTap;
  final bool isRecording;

  @override
  Widget build(BuildContext context) {
    final Widget iconWidget;
    if (assetPath != null) {
      iconWidget = Image.asset(
        assetPath!,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
        //color: AppColors.background,
        // colorBlendMode: BlendMode.srcIn,
      );
    } else {
      iconWidget = Icon(icon, size: 24, color: AppColors.background);
    }

    final bool showRecordingAnimation =
        isRecording && assetPath == 'assets/record.png';

    return FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.darkBlue,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: showRecordingAnimation
                  ? const Color(0xFFFFECEC)
                  : const Color(0xFFF1F2F7),
              borderRadius: BorderRadius.circular(18),
              border: showRecordingAnimation
                  ? Border.all(color: Colors.redAccent, width: 1.6)
                  : null,
            ),
            child: Center(
              child: AnimatedScale(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                scale: showRecordingAnimation ? 1.08 : 1.0,
                child: showRecordingAnimation
                    ? const Icon(Icons.mic, size: 24, color: Colors.redAccent)
                    : iconWidget,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
